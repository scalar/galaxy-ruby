# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::LoginPortals#create
    class LoginPortalCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute email
      #
      #   @return [Scalar::Models::LoginPortalEmail]
      required :email, -> { Scalar::LoginPortalEmail }

      # @!attribute page
      #
      #   @return [Scalar::Models::LoginPortalPage]
      required :page, -> { Scalar::LoginPortalPage }

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!method initialize(email:, page:, slug:, title:, request_options: {})
      #   @param email [Scalar::Models::LoginPortalEmail]
      #   @param page [Scalar::Models::LoginPortalPage]
      #   @param slug [String]
      #   @param title [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
