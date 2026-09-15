# frozen_string_literal: true

module Scalar
  module Models
    module Schemas
      # @see Scalar::Resources::Schemas::Version#retrieve
      class VersionRetrieveParams < Scalar::Internal::Type::BaseModel
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

        # @!attribute semver
        #
        #   @return [String]
        required :semver, String

        # @!method initialize(namespace:, slug:, semver:, request_options: {})
        #   @param namespace [String]
        #   @param slug [String]
        #   @param semver [String]
        #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
