# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Registry#update_api_document_version
    class RegistryUpdateAPIDocumentVersionResponse < Scalar::Internal::Type::BaseModel
      # @!attribute json_sha
      #
      #   @return [String]
      required :json_sha, String, api_name: :jsonSha

      # @!attribute version_sha
      #
      #   @return [String]
      required :version_sha, String, api_name: :versionSha

      # @!attribute yaml_sha
      #
      #   @return [String]
      required :yaml_sha, String, api_name: :yamlSha

      # @!method initialize(json_sha:, version_sha:, yaml_sha:)
      #   @param json_sha [String]
      #   @param version_sha [String]
      #   @param yaml_sha [String]
    end
  end
end
