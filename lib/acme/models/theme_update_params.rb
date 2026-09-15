# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Themes#update
    class ThemeUpdateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(slug:, description: nil, name: nil, request_options: {})
      #   @param slug [String]
      #   @param description [String]
      #   @param name [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
