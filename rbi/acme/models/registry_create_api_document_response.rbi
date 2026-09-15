# typed: strong

module Scalar
  module Models
    class RegistryCreateAPIDocumentResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::RegistryCreateAPIDocumentResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :json_sha

      sig { returns(String) }
      attr_accessor :title

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(String) }
      attr_accessor :version_sha

      sig { returns(String) }
      attr_accessor :version_uid

      sig { returns(String) }
      attr_accessor :yaml_sha

      sig do
        params(
          json_sha: String,
          title: String,
          uid: String,
          version_sha: String,
          version_uid: String,
          yaml_sha: String
        ).returns(T.attached_class)
      end
      def self.new(
        json_sha:,
        title:,
        uid:,
        version_sha:,
        version_uid:,
        yaml_sha:
      )
      end

      sig do
        override.returns(
          {
            json_sha: String,
            title: String,
            uid: String,
            version_sha: String,
            version_uid: String,
            yaml_sha: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
