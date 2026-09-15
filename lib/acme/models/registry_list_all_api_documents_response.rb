# frozen_string_literal: true

module Scalar
  module Models
    class RegistryListAllAPIDocumentsResponseItem < Scalar::Internal::Type::BaseModel
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

      # @!attribute tags
      #
      #   @return [Object]
      required :tags, Scalar::Internal::Type::Unknown

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute version
      #
      #   @return [String]
      required :version, String

      # @!attribute versions
      #
      #   @return [Array<Scalar::Models::ManagedDocVersion>]
      required :versions, -> { Scalar::Internal::Type::ArrayOf[Scalar::ManagedDocVersion] }

      # @!method initialize(description:, is_private:, namespace:, slug:, tags:, title:, uid:, version:, versions:)
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param namespace [String]
      #   @param slug [String]
      #   @param tags [Object]
      #   @param title [String]
      #   @param uid [String]
      #   @param version [String]
      #   @param versions [Array<Scalar::Models::ManagedDocVersion>]
    end

    # @type [Scalar::Internal::Type::Converter]
    RegistryListAllAPIDocumentsResponse =
      Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::RegistryListAllAPIDocumentsResponseItem }]
  end
end
