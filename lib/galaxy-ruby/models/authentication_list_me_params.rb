# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Authentication#list_me
    class AuthenticationListMeParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
