# frozen_string_literal: true

module Scalar
  module Models
    class UID < Scalar::Internal::Type::BaseModel
      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!method initialize(uid:)
      #   @param uid [String]
    end
  end
end
