# frozen_string_literal: true

module Scalar
  module Models
    module Schemas
      # @see Scalar::Resources::Schemas::Version#create
      class VersionCreateParams < Scalar::Internal::Type::BaseModel
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

        # @!attribute document
        #
        #   @return [String]
        required :document, String

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(namespace:, slug:, document:, version:, request_options: {})
        #   @param namespace [String]
        #   @param slug [String]
        #   @param document [String]
        #   @param version [String]
        #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
