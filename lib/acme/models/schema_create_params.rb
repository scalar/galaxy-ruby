# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Schemas#create
    class SchemaCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute document
      #
      #   @return [String]
      required :document, String

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute version
      #
      #   @return [String]
      required :version, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute is_private
      #
      #   @return [Boolean, nil]
      optional :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!method initialize(namespace:, document:, slug:, title:, version:, description: nil, is_private: nil, request_options: {})
      #   @param namespace [String]
      #   @param document [String]
      #   @param slug [String]
      #   @param title [String]
      #   @param version [String]
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
