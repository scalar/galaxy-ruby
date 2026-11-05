# typed: strong

module ScalarGalaxy
  module Resources
    class Webhooks
      sig do
        params(
          payload: String,
          headers:
            T::Hash[T.any(String, Symbol), T.any(String, T::Array[String])],
          key: T.nilable(String)
        ).returns(ScalarGalaxy::NewPlanetWebhookEvent)
      end
      def unwrap(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: nil
      )
      end

      # Back-compat alias for `unwrap`, which it calls with the same arguments. SDKs
      # that named this helper `parsed` shipped it under this name.
      #
      # @deprecated Use `unwrap` instead.
      sig do
        params(
          payload: String,
          headers:
            T::Hash[T.any(String, Symbol), T.any(String, T::Array[String])],
          key: T.nilable(String)
        ).returns(ScalarGalaxy::NewPlanetWebhookEvent)
      end
      def parsed(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: nil
      )
      end

      # Verifies that the payload was signed with the webhook key, raising when it was
      # not.
      sig do
        params(
          payload: String,
          headers:
            T::Hash[T.any(String, Symbol), T.any(String, T::Array[String])],
          key: T.nilable(String)
        ).returns(T::Hash[Symbol, T.untyped])
      end
      def verify_signature(
        # The raw webhook payload as a string
        payload:,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: nil
      )
      end

      # Parses the payload into a typed event without verifying its signature.
      #
      # Only use this for a payload whose signature was already verified, or in tests.
      sig do
        params(payload: String).returns(ScalarGalaxy::NewPlanetWebhookEvent)
      end
      def parse_unsafe(
        # The raw webhook payload as a string
        payload
      )
      end

      # @api private
      sig { params(client: ScalarGalaxy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
