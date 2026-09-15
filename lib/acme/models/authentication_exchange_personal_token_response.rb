# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Authentication#exchange_personal_token
    class AuthenticationExchangePersonalTokenResponse < Scalar::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String, api_name: :accessToken

      # @!method initialize(access_token:)
      #   @param access_token [String]
    end
  end
end
