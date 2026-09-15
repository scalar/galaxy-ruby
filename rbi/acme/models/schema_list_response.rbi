# typed: strong

module Scalar
  module Models
    class SchemaListResponseItem < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::SchemaListResponseItem,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :description

      sig { returns(T::Boolean) }
      attr_accessor :is_private

      sig { returns(String) }
      attr_accessor :namespace

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :title

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(T::Array[Scalar::Models::SchemaListResponseItem::Version]) }
      attr_accessor :versions

      sig do
        params(
          description: String,
          is_private: T::Boolean,
          namespace: String,
          slug: String,
          title: String,
          uid: String,
          versions:
            T::Array[Scalar::Models::SchemaListResponseItem::Version::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        description:,
        is_private:,
        namespace:,
        slug:,
        title:,
        uid:,
        versions:
      )
      end

      sig do
        override.returns(
          {
            description: String,
            is_private: T::Boolean,
            namespace: String,
            slug: String,
            title: String,
            uid: String,
            versions: T::Array[Scalar::Models::SchemaListResponseItem::Version]
          }
        )
      end
      def to_hash
      end

      class Version < Scalar::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scalar::Models::SchemaListResponseItem::Version,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :uid

        sig { returns(Integer) }
        attr_accessor :updated_at

        sig { returns(String) }
        attr_accessor :version

        sig do
          params(
            created_at: Integer,
            uid: String,
            updated_at: Integer,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(created_at:, uid:, updated_at:, version:)
        end

        sig do
          override.returns(
            {
              created_at: Integer,
              uid: String,
              updated_at: Integer,
              version: String
            }
          )
        end
        def to_hash
        end
      end
    end

    SchemaListResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[Scalar::Models::SchemaListResponseItem],
        Scalar::Internal::Type::Converter
      )
  end
end
