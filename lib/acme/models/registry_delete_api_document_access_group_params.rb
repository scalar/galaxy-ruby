# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Registry#delete_api_document_access_group
    class RegistryDeleteAPIDocumentAccessGroupParams < Scalar::Models::AccessGroup
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!method initialize(namespace:, slug:, request_options: {})
      #   @param namespace [String]
      #   @param slug [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
