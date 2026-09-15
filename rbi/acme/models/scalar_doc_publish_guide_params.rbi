# typed: strong

module Scalar
  module Models
    class ScalarDocPublishGuideParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::ScalarDocPublishGuideParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :slug

      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(slug:, request_options: {})
      end

      sig do
        override.returns(
          { slug: String, request_options: Scalar::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
