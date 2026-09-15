# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Rules#update_ruleset
    class RuleUpdateRulesetParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute path_namespace
      #
      #   @return [String]
      required :path_namespace, String

      # @!attribute path_slug
      #
      #   @return [String]
      required :path_slug, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute is_private
      #
      #   @return [Boolean, nil]
      optional :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute body_namespace
      #
      #   @return [String, nil]
      optional :body_namespace, String, api_name: :namespace

      # @!attribute body_slug
      #
      #   @return [String, nil]
      optional :body_slug, String, api_name: :slug

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(path_namespace:, path_slug:, description: nil, is_private: nil, body_namespace: nil, body_slug: nil, title: nil, request_options: {})
      #   @param path_namespace [String]
      #   @param path_slug [String]
      #   @param description [String]
      #   @param is_private [Boolean]
      #   @param body_namespace [String]
      #   @param body_slug [String]
      #   @param title [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
