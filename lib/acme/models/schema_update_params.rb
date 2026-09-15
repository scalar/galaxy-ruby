# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Schemas#update
    class SchemaUpdateParams < Scalar::Internal::Type::BaseModel
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

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute is_private
      #
      #   @return [Boolean, nil]
      optional :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(namespace:, slug:, description: nil, is_private: nil, title: nil, request_options: {})
      #   @param namespace [String]
      #   @param slug [String]
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param title [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
