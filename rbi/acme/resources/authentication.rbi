# typed: strong

module Scalar
  module Resources
    # Authentication
    class Authentication
      # Exchange an API key for an access token.
      sig do
        params(
          personal_token: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::AuthenticationExchangePersonalTokenResponse)
      end
      def exchange_personal_token(personal_token:, request_options: {})
      end

      # Get the authenticated user, including their available teams and theme.
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(
          Scalar::Models::AuthenticationListCurrentUserResponse
        )
      end
      def list_current_user(request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
