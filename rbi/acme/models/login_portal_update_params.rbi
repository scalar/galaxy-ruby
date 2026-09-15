# typed: strong

module Scalar
  module Models
    class LoginPortalUpdateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::LoginPortalUpdateParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(slug:, title: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            slug: String,
            title: String,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
