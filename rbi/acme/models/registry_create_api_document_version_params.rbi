# typed: strong

module Scalar
  module Models
    class RegistryCreateAPIDocumentVersionParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scalar::RegistryCreateAPIDocumentVersionParams,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :namespace

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :document

      sig { returns(String) }
      attr_accessor :version

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      sig { returns(T.nilable(String)) }
      attr_reader :last_known_version_sha

      sig { params(last_known_version_sha: String).void }
      attr_writer :last_known_version_sha

      sig do
        params(
          namespace: String,
          slug: String,
          document: String,
          version: String,
          force: T::Boolean,
          last_known_version_sha: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace:,
        slug:,
        document:,
        version:,
        force: nil,
        last_known_version_sha: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            slug: String,
            document: String,
            version: String,
            force: T::Boolean,
            last_known_version_sha: String,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
