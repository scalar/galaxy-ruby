# typed: strong

module Scalar
  module Models
    class LoginPortalCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::LoginPortalCreateParams, Scalar::Internal::AnyHash)
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

      sig do
        params(
          email: Scalar::LoginPortalEmail::OrHash,
          page: Scalar::LoginPortalPage::OrHash,
          slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(email:, page:, slug:, title:, request_options: {})
      end

      sig do
        override.returns(
          {
            email: Scalar::LoginPortalEmail,
            page: Scalar::LoginPortalPage,
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
