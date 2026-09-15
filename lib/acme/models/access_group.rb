# frozen_string_literal: true

module Scalar
  module Models
    class AccessGroup < Scalar::Internal::Type::BaseModel
      # @!attribute access_group_slug
      #
      #   @return [String]
      required :access_group_slug, String, api_name: :accessGroupSlug

      # @!method initialize(access_group_slug:)
      #   @param access_group_slug [String]
    end
  end
end
