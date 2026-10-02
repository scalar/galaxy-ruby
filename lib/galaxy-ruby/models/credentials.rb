# frozen_string_literal: true

module ScalarGalaxy
  module Models
    class Credentials < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute email
      #
      #   @return [String]
      required :email, String

      request_only do
        # @!attribute password
        #
        #   @return [String]
        required :password, String
      end

      # @!method initialize(email:, password:)
      #   Credentials to authenticate a user
      #
      #   @param email [String]
      #   @param password [String]
    end
  end
end
