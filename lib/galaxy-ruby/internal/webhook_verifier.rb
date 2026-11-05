# frozen_string_literal: true

module ScalarGalaxy
  module Errors
    # Raised when a webhook delivery fails Standard Webhooks signature verification: a required
    # header is missing, the timestamp is unreadable or outside the tolerance, or no signature matches.
    class WebhookVerificationError < ScalarGalaxy::Errors::Error
    end
  end

  module Internal
    # @api private
    #
    # Verifies Standard Webhooks signatures with the standard library alone: an HMAC-SHA256 over
    # `"<id>.<timestamp>.<payload>"`, keyed with the base64-decoded secret, which the
    # `webhook-signature` header carries as one or more space-separated `v1,<base64>` entries.
    #
    # @see https://github.com/standard-webhooks/standard-webhooks/blob/main/spec/standard-webhooks.md
    module WebhookVerifier
      # Prefix the Standard Webhooks dashboards put on a signing secret; it is not part of the key.
      SECRET_PREFIX = "whsec_"

      # How far, in seconds, the `webhook-timestamp` may sit from now in either direction. The
      # signature covers the timestamp, so this bounds how long a captured delivery can be replayed;
      # the future side allows for a sender whose clock runs ahead.
      TOLERANCE_SECONDS = 5 * 60

      # @api private
      #
      # Prepended onto `StandardWebhooks::StandardWebhooksError`'s singleton class (see the end of this
      # file), so a `rescue StandardWebhooks::WebhookVerificationError` or
      # `rescue StandardWebhooks::StandardWebhooksError` written against the gem this SDK used to call
      # still catches this SDK's verification error. `rescue` and `case` match with `===`, so only
      # those two classes are widened, and only for this SDK's error; `WebhookSigningError` and every
      # other class keep plain `Module#===`. The match itself goes through `Module#===` too, so a
      # `BasicObject` (no `is_a?`) is a plain non-match. Anything that checks the class directly
      # (`is_a?`, `e.class`, a lookup by class name) sees the SDK's class.
      module LegacyRescue
        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other)
          return true if super

          (
            equal?(::StandardWebhooks::StandardWebhooksError) ||
              equal?(::StandardWebhooks::WebhookVerificationError)
          ) && ScalarGalaxy::Errors::WebhookVerificationError === other
        end
      end

      class << self
        # @api private
        #
        # @param payload [String] the raw request body, exactly as received
        # @param headers [Hash{String, Symbol=>String, Array<String>}] names match in any case; see
        #   {header_value}
        # @param secret [String] the signing secret, with or without the `whsec_` prefix
        #
        # @raise [ArgumentError] when the secret decodes to no key bytes at all
        # @raise [ScalarGalaxy::Errors::WebhookVerificationError]
        # @return [void]
        def verify!(payload, headers, secret)
          key = decode_secret(secret)

          msg_id = header_value(headers, "webhook-id")
          msg_timestamp = header_value(headers, "webhook-timestamp")
          msg_signature = header_value(headers, "webhook-signature")
          if !msg_id || !msg_timestamp || !msg_signature
            raise ScalarGalaxy::Errors::WebhookVerificationError, "Missing required headers"
          end

          verify_timestamp!(msg_timestamp)

          signed = "#{msg_id}.#{msg_timestamp}.#{payload}"
          expected = [OpenSSL::HMAC.digest(OpenSSL::Digest.new("SHA256"), key, signed)].pack("m0")
          # `split(" ")` splits on any run of whitespace, so a header folded with tabs or newlines
          # still yields its entries. The explicit pattern matters: a bare `split` uses `$;` when the
          # host process has set it. Entries for other versions are skipped rather than rejected,
          # which is what lets a sender add a new scheme beside `v1`.
          entries = msg_signature.split(" ")
          matched =
            entries.any? do |entry|
              version, signature = entry.split(",", 2)
              version == "v1" && secure_compare(expected, signature)
            end
          return if matched

          raise ScalarGalaxy::Errors::WebhookVerificationError, "No matching signature found"
        end

        # @api private
        #
        # HTTP header names are case-insensitive, and callers spell them differently: a hash built by
        # hand or copied from a log is often title-cased (`Webhook-Id`), upper-cased, or keyed by
        # Symbol. The exact lowercase String key wins when present; otherwise the first String or Symbol
        # key matching in any case is used. A multi-valued header (an Array, as
        # `Net::HTTPHeader#to_hash` returns them) yields its first value. A Rack `env` hash is not a
        # header hash: its `HTTP_WEBHOOK_ID` keys do not match, so pass the request's headers instead.
        #
        # @param headers [Hash{String, Symbol=>String, Array<String>}]
        # @param name [String] the lowercase header name
        #
        # @return [String, nil]
        private def header_value(headers, name)
          value = headers[name]
          # An object that only answers `[]` (some framework header wrappers fold case there) has
          # nothing to scan, so a miss stays a miss.
          if value.nil? && headers.respond_to?(:each)
            headers.each do |key, candidate|
              next unless !candidate.nil? && (key.is_a?(String) || key.is_a?(Symbol))
              next unless key.to_s.downcase == name

              value = candidate
              break
            end
          end
          value.is_a?(Array) ? value.first : value
        end

        # @api private
        #
        # The secret is base64 after its optional `whsec_` prefix. It is decoded leniently, the way
        # `Base64.decode64` does it, skipping characters outside the alphabet and tolerating missing
        # padding, so every secret that verified before still does; strict decoding would turn a
        # pasted secret with a stray newline into a crash.
        #
        # A secret that decodes to nothing (`""`, a bare `whsec_`, an unset variable read as an empty
        # string) is refused rather than used: an HMAC keyed with no bytes is one anyone can compute,
        # so every forged delivery would verify. A misconfiguration, so it is an `ArgumentError`, like
        # the missing-key check in the helper that calls this, not a verification failure.
        #
        # @param secret [String]
        #
        # @raise [ArgumentError]
        # @return [String]
        private def decode_secret(secret)
          key = secret.delete_prefix(SECRET_PREFIX).unpack1("m")
          raise ArgumentError, "Webhook secret decodes to an empty key" if key.empty?

          key
        end

        # @api private
        #
        # `Integer()` accepts an optional sign, surrounding whitespace, `_` separators and a `0x`-style
        # prefix, and rejects anything else, so the comparison below only ever sees a whole number of
        # seconds. The signature is still computed over the header exactly as it was sent.
        #
        # @param msg_timestamp [String]
        #
        # @raise [ScalarGalaxy::Errors::WebhookVerificationError]
        private def verify_timestamp!(msg_timestamp)
          timestamp =
            begin
              Integer(msg_timestamp)
            rescue StandardError
              raise ScalarGalaxy::Errors::WebhookVerificationError, "Invalid Signature Headers"
            end

          now = Time.now.to_i
          if timestamp < now - TOLERANCE_SECONDS
            raise ScalarGalaxy::Errors::WebhookVerificationError, "Message timestamp too old"
          end
          return unless timestamp > now + TOLERANCE_SECONDS

          raise ScalarGalaxy::Errors::WebhookVerificationError, "Message timestamp too new"
        end

        # @api private
        #
        # Compares in constant time, so how long a mismatch takes says nothing about how many leading
        # bytes of a forged signature were right. `OpenSSL.fixed_length_secure_compare` raises on
        # inputs of different lengths, so the lengths are checked first; that only reveals the length,
        # which every valid signature shares.
        #
        # @param expected [String]
        # @param signature [String, nil]
        #
        # @return [Boolean]
        private def secure_compare(expected, signature)
          return false unless signature.is_a?(String) && expected.bytesize == signature.bytesize

          OpenSSL.fixed_length_secure_compare(expected, signature)
        end
      end
    end
  end
end

# The two error classes the `standardwebhooks` gem raised verification failures as, declared with the
# gem's own hierarchy so that whichever of the gem and this file loads second reopens them instead of
# conflicting. Code written against the gem keeps resolving the constants without it installed, and
# `LegacyRescue` makes its `rescue` clauses catch this SDK's error.
module StandardWebhooks
  class StandardWebhooksError < StandardError
  end

  class WebhookVerificationError < StandardWebhooksError
  end
end

StandardWebhooks::StandardWebhooksError.singleton_class.prepend(
  ScalarGalaxy::Internal::WebhookVerifier::LegacyRescue
)
