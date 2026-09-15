# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::LoginPortals#retrieve
    class LoginPortalRetrieveParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!method initialize(slug:, request_options: {})
      #   @param slug [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
