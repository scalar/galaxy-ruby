# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::LoginPortals#update
    class LoginPortalUpdateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(slug:, title: nil, request_options: {})
      #   @param slug [String]
      #   @param title [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
