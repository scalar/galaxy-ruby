# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::ScalarDocs#create_guide
    class ScalarDocCreateGuideParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!attribute allowed_domains
      #
      #   @return [Array<String>]
      required :allowed_domains, Scalar::Internal::Type::ArrayOf[String], api_name: :allowedDomains

      # @!attribute allowed_users
      #
      #   @return [Array<String>]
      required :allowed_users, Scalar::Internal::Type::ArrayOf[String], api_name: :allowedUsers

      # @!attribute is_private
      #
      #   @return [Boolean]
      required :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #
      #   @return [String, nil]
      optional :slug, String

      # @!method initialize(allowed_domains:, allowed_users:, is_private:, name:, slug: nil, request_options: {})
      #   @param allowed_domains [Array<String>]
      #   @param allowed_users [Array<String>]
      #   @param is_private [Boolean]
      #   @param name [String]
      #   @param slug [String]
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
