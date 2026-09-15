# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::LoginPortals#retrieve
    class LoginPortalRetrieveResponse < Scalar::Internal::Type::BaseModel
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

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!method initialize(email:, page:, slug:, title:, uid:)
      #   @param email [Scalar::Models::LoginPortalEmail]
      #   @param page [Scalar::Models::LoginPortalPage]
      #   @param slug [String]
      #   @param title [String]
      #   @param uid [String]
    end
  end
end
