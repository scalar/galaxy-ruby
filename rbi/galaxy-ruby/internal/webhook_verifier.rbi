# typed: strong

module ScalarGalaxy
  module Errors
    class WebhookVerificationError < ScalarGalaxy::Errors::Error
    end
  end

  module Internal
    # @api private
    module WebhookVerifier
      SECRET_PREFIX = "whsec_"

      TOLERANCE_SECONDS = T.let(T.unsafe(nil), Integer)

      DEFAULT_ALGORITHM = "hmac-sha256"

      HMAC_DIGESTS = T.let(T.unsafe(nil), T::Hash[String, String])

      # @api private
      module LegacyRescue
        sig { params(other: T.anything).returns(T::Boolean) }
        def ===(other)
        end
      end

      class << self
        # @api private
        sig do
          params(
            payload: String,
            headers: T::Hash[T.any(String, Symbol), T.any(String, T::Array[String])],
            secret: String,
            algorithm: String,
            id_header: String,
            timestamp_header: String,
            signature_header: String,
            tolerance: Integer,
            decoder: T.nilable(String)
          ).void
        end
        def verify!(
          payload,
          headers,
          secret,
          algorithm: DEFAULT_ALGORITHM,
          id_header: "webhook-id",
          timestamp_header: "webhook-timestamp",
          signature_header: "webhook-signature",
          tolerance: TOLERANCE_SECONDS,
          decoder: nil
        )
        end

        # @api private
        sig do
          params(
            headers: T::Hash[T.any(String, Symbol), T.any(String, T::Array[String])],
            name: String
          ).returns(T.nilable(String))
        end
        private def header_value(headers, name)
        end

        # @api private
        sig { params(secret: String).returns(String) }
        private def decode_secret(secret)
        end

        # @api private
        sig { params(msg_timestamp: String, tolerance: Integer).void }
        private def verify_timestamp!(msg_timestamp, tolerance = TOLERANCE_SECONDS)
        end

        # @api private
        sig { params(expected: String, signature: T.nilable(String)).returns(T::Boolean) }
        private def secure_compare(expected, signature)
        end
      end
    end
  end
end

module StandardWebhooks
  class StandardWebhooksError < StandardError
  end

  class WebhookVerificationError < StandardWebhooksError
  end
end
