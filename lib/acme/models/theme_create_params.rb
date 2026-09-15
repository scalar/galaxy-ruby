# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Themes#create
    class ThemeCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute document
      #
      #   @return [String]
      required :document, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(document:, name:, slug:, description: nil, request_options: {})
      #   @param document [String]
      #   @param name [String]
      #   @param slug [String]
      #   @param description [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
