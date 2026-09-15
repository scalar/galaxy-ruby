# frozen_string_literal: true

module Scalar
  module Models
    class RuleListRulesetsResponseItem < Scalar::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute is_private
      #
      #   @return [Boolean]
      required :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

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

      # @!method initialize(description:, is_private:, namespace:, slug:, title:, uid:)
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param namespace [String]
      #   @param slug [String]
      #   @param title [String]
      #   @param uid [String]
    end

    # @type [Scalar::Internal::Type::Converter]
    RuleListRulesetsResponse =
      Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::RuleListRulesetsResponseItem }]
  end
end
