# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Rules#retrieve_ruleset_document
    class RuleRetrieveRulesetDocumentParams < Scalar::Internal::Type::BaseModel
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
