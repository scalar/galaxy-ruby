# frozen_string_literal: true

module ScalarGalaxy
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key
      #
      # @return [ScalarGalaxy::Models::NewPlanetWebhookEvent]
      def unwrap(payload, headers:, key: @client.webhook_secret)
        if key.nil?
          raise ArgumentError.new(
            "Cannot verify a webhook without a key on either the client's webhook_secret or passed in as an argument"
          )
        end

        ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

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
