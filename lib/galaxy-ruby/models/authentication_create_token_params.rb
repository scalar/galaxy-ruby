# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Authentication#create_token
    class AuthenticationCreateTokenParams < ScalarGalaxy::Models::Credentials
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
