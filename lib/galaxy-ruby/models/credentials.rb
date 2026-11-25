# frozen_string_literal: true

module ScalarGalaxy
  module Models
    class Credentials < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!method initialize(email:)
      #   Credentials to authenticate a user
      #
      #   @param email [String]
    end
  end
end
