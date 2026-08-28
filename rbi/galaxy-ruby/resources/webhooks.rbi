# typed: strong

module ScalarGalaxy
  module Resources
    class Webhooks
      sig do
        params(
          payload: String,
          headers: T::Hash[String, String],
          key: T.nilable(String)
        ).returns(ScalarGalaxy::NewPlanetWebhookEvent)
      end
      def unwrap(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: @client.webhook_secret
      )
      end

      # @api private
      sig { params(client: ScalarGalaxy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
