# typed: strong

module Scalar
  module Models
    class LoginPortalListResponseItem < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::LoginPortalListResponseItem,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :title

      sig { returns(String) }
      attr_accessor :uid

      sig do
        params(slug: String, title: String, uid: String).returns(
          T.attached_class
        )
      end
      def self.new(slug:, title:, uid:)
      end

      sig { override.returns({ slug: String, title: String, uid: String }) }
      def to_hash
      end
    end

    LoginPortalListResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[
          Scalar::Models::LoginPortalListResponseItem
        ],
        Scalar::Internal::Type::Converter
      )
  end
end
