# frozen_string_literal: true

module Scalar
  module Resources
    # Authentication
    class Authentication
      # Exchange an API key for an access token.
      #
      # @overload exchange_personal_token(personal_token:, request_options: {})
      #
      # @param personal_token [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::AuthenticationExchangePersonalTokenResponse]
      #
      # @see Scalar::Models::AuthenticationExchangePersonalTokenParams
      def exchange_personal_token(params)
        parsed, options = Scalar::AuthenticationExchangePersonalTokenParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/auth/exchange",
          body: parsed,
          model: Scalar::Models::AuthenticationExchangePersonalTokenResponse,
          options: options
        )
      end

      # Get the authenticated user, including their available teams and theme.
      #
      # @overload list_current_user(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::AuthenticationListCurrentUserResponse]
      #
      # @see Scalar::Models::AuthenticationListCurrentUserParams
      def list_current_user(params = {})
        @client.request(
          method: :get,
          path: "v1/auth/me",
          model: Scalar::Models::AuthenticationListCurrentUserResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Scalar::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
