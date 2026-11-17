# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Authentication#create_token
    class AuthenticationCreateTokenParams < ScalarGalaxy::Models::Credentials
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute password
      #
      #   @return [String]
      required :password, String

      # @!method initialize(password:, request_options: {})
      #   @param password [String]
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
