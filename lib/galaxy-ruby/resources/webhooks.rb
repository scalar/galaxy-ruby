# frozen_string_literal: true

module ScalarGalaxy
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String, Symbol=>String, Array<String>}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key. When `nil`, the client's `webhook_secret` is used if it was passed to the client, else `ENV["SCALAR_WEBHOOK_SECRET"]` read at call time, else the client's `webhook_secret` as read when the client was built.
      #
      # @return [ScalarGalaxy::Models::NewPlanetWebhookEvent]
      def unwrap(payload, headers:, key: nil)
        key ||= @client.explicit_webhook_secret
        key_from_env = ENV["SCALAR_WEBHOOK_SECRET"]
        key ||= key_from_env unless key_from_env.to_s.strip.empty?
        key ||= @client.webhook_secret
        if key.nil? || key.delete_prefix("whsec_").unpack1("m").empty?
          raise ArgumentError.new(
            "Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument (or set in the SCALAR_WEBHOOK_SECRET environment variable)"
          )
        end

        ScalarGalaxy::Internal::WebhookVerifier.verify!(payload, headers, key)

        parsed = JSON.parse(payload, symbolize_names: true)
        ScalarGalaxy::Internal::Type::Converter.coerce(ScalarGalaxy::Models::UnwrapWebhookEvent, parsed)
      end

      # Back-compat alias for `unwrap`, which it calls with the same arguments. SDKs
      # that named this helper `parsed` shipped it under this name.
      #
      # @deprecated Use {#unwrap} instead.
      #
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String, Symbol=>String, Array<String>}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key. When `nil`, the client's `webhook_secret` is used if it was passed to the client, else `ENV["SCALAR_WEBHOOK_SECRET"]` read at call time, else the client's `webhook_secret` as read when the client was built.
      #
      # @return [ScalarGalaxy::Models::NewPlanetWebhookEvent]
      def parsed(payload, headers:, key: nil)
        unwrap(payload, headers: headers, key: key)
      end

      # Verifies that the payload was signed with the webhook key, raising when it was
      # not.
      #
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String, Symbol=>String, Array<String>}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key. When `nil`, the client's `webhook_secret` is used if it was passed to the client, else `ENV["SCALAR_WEBHOOK_SECRET"]` read at call time, else the client's `webhook_secret` as read when the client was built.
      #
      # @return [Hash{Symbol=>Object}] The verified payload, parsed with symbolized keys
      def verify_signature(payload:, headers:, key: nil)
        key ||= @client.explicit_webhook_secret
        key_from_env = ENV["SCALAR_WEBHOOK_SECRET"]
        key ||= key_from_env unless key_from_env.to_s.strip.empty?
        key ||= @client.webhook_secret
        if key.nil? || key.delete_prefix("whsec_").unpack1("m").empty?
          raise ArgumentError.new(
            "The webhook secret must either be set using the env var, SCALAR_WEBHOOK_SECRET, on the client class, or passed to this method"
          )
        end

        ScalarGalaxy::Internal::WebhookVerifier.verify!(payload, headers, key)
        JSON.parse(payload, symbolize_names: true)
      end

      # Parses the payload into a typed event without verifying its signature.
      #
      # Only use this for a payload whose signature was already verified, or in tests.
      #
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [ScalarGalaxy::Models::NewPlanetWebhookEvent]
      def parse_unsafe(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        ScalarGalaxy::Internal::Type::Converter.coerce(ScalarGalaxy::Models::UnwrapWebhookEvent, parsed)
      end

      # @api private
      #
      # @param client [ScalarGalaxy::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
