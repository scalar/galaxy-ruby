# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Authentication#exchange_personal_token
    class AuthenticationExchangePersonalTokenParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute personal_token
      #
      #   @return [String]
      required :personal_token, String, api_name: :personalToken

      # @!method initialize(personal_token:, request_options: {})
      #   @param personal_token [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
