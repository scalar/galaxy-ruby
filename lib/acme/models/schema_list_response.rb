# frozen_string_literal: true

module Scalar
  module Models
    class SchemaListResponseItem < Scalar::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute is_private
      #
      #   @return [Boolean]
      required :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute versions
      #
      #   @return [Array<Scalar::Models::SchemaListResponseItem::Version>]
      required :versions,
               -> { Scalar::Internal::Type::ArrayOf[Scalar::Models::SchemaListResponseItem::Version] }

      # @!method initialize(description:, is_private:, namespace:, slug:, title:, uid:, versions:)
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param namespace [String]
      #   @param slug [String]
      #   @param title [String]
      #   @param uid [String]
      #   @param versions [Array<Scalar::Models::SchemaListResponseItem::Version>]

      class Version < Scalar::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [Integer]
        required :created_at, Integer, api_name: :createdAt

        # @!attribute uid
        #
        #   @return [String]
        required :uid, String

        # @!attribute updated_at
        #
        #   @return [Integer]
        required :updated_at, Integer, api_name: :updatedAt

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(created_at:, uid:, updated_at:, version:)
        #   @param created_at [Integer]
        #   @param uid [String]
        #   @param updated_at [Integer]
        #   @param version [String]
      end
    end

    # @type [Scalar::Internal::Type::Converter]
    SchemaListResponse = Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::SchemaListResponseItem }]
  end
end
