# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Themes#replace_document
    class ThemeReplaceDocumentParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute document
      #
      #   @return [String]
      required :document, String

      # @!method initialize(slug:, document:, request_options: {})
      #   @param slug [String]
      #   @param document [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
