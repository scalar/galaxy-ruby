# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Authentication#create_user
    class AuthenticationCreateUserParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!attribute password
      #
      #   @return [String]
      required :password, String

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(email:, password:, name: nil, request_options: {})
      #   @param email [String]
      #   @param password [String]
      #   @param name [String]
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
