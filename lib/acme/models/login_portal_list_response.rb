# frozen_string_literal: true

module Scalar
  module Models
    class LoginPortalListResponseItem < Scalar::Internal::Type::BaseModel
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

      # @!method initialize(slug:, title:, uid:)
      #   @param slug [String]
      #   @param title [String]
      #   @param uid [String]
    end

    # @type [Scalar::Internal::Type::Converter]
    LoginPortalListResponse =
      Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::LoginPortalListResponseItem }]
  end
end
