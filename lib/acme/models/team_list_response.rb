# frozen_string_literal: true

module Scalar
  module Models
    class TeamListResponseItem < Scalar::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute theme
      #
      #   @return [String]
      required :theme, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute image_uri
      #
      #   @return [String, nil]
      optional :image_uri, String, api_name: :imageUri

      # @!method initialize(name:, slug:, theme:, uid:, image_uri: nil)
      #   @param name [String]
      #   @param slug [String]
      #   @param theme [String]
      #   @param uid [String]
      #   @param image_uri [String]
    end

    # @type [Scalar::Internal::Type::Converter]
    TeamListResponse = Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::TeamListResponseItem }]
  end
end
