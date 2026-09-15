# typed: strong

module Scalar
  module Models
    class LoginPortalRetrieveResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::LoginPortalRetrieveResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(Scalar::LoginPortalEmail) }
      attr_reader :email

      sig { params(email: Scalar::LoginPortalEmail::OrHash).void }
      attr_writer :email

      sig { returns(Scalar::LoginPortalPage) }
      attr_reader :page

      sig { params(page: Scalar::LoginPortalPage::OrHash).void }
      attr_writer :page

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :title

      sig { returns(String) }
      attr_accessor :uid

      sig do
        params(
          email: Scalar::LoginPortalEmail::OrHash,
          page: Scalar::LoginPortalPage::OrHash,
          slug: String,
          title: String,
          uid: String
        ).returns(T.attached_class)
      end
      def self.new(email:, page:, slug:, title:, uid:)
      end

      sig do
        override.returns(
          {
            email: Scalar::LoginPortalEmail,
            page: Scalar::LoginPortalPage,
            slug: String,
            title: String,
            uid: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
