# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Authentication#create_token
    class AuthenticationCreateTokenResponse < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute token
      #
      #   @return [String, nil]
      optional :token, String

      # @!method initialize(token: nil)
      #   @param token [String]
    end
  end
end
