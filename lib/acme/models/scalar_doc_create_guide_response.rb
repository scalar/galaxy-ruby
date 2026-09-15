# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::ScalarDocs#create_guide
    class ScalarDocCreateGuideResponse < Scalar::Internal::Type::BaseModel
      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!method initialize(slug:, uid:)
      #   @param slug [String]
      #   @param uid [String]
    end
  end
end
