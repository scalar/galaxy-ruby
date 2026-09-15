# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Registry#create_api_document
    class RegistryCreateAPIDocumentResponse < Scalar::Internal::Type::BaseModel
      # @!attribute json_sha
      #
      #   @return [String]
      required :json_sha, String, api_name: :jsonSha

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute version_sha
      #
      #   @return [String]
      required :version_sha, String, api_name: :versionSha

      # @!attribute version_uid
      #
      #   @return [String]
      required :version_uid, String, api_name: :versionUid

      # @!attribute yaml_sha
      #
      #   @return [String]
      required :yaml_sha, String, api_name: :yamlSha

      # @!method initialize(json_sha:, title:, uid:, version_sha:, version_uid:, yaml_sha:)
      #   @param json_sha [String]
      #   @param title [String]
      #   @param uid [String]
      #   @param version_sha [String]
      #   @param version_uid [String]
      #   @param yaml_sha [String]
    end
  end
end
