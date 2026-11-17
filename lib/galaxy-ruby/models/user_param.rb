# frozen_string_literal: true

module ScalarGalaxy
  module Models
    class UserParam < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      drop_on_dump :id

      # @!method initialize(name: nil)
      #   A user
      #
      #   @param name [String]
    end
  end
end
