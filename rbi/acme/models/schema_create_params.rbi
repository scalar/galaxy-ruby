# typed: strong

module Scalar
  module Models
    class SchemaCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::SchemaCreateParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :namespace

      sig { returns(String) }
      attr_accessor :document

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :title

      sig { returns(String) }
      attr_accessor :version

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private

      sig { params(is_private: T::Boolean).void }
      attr_writer :is_private

      sig do
        params(
          namespace: String,
          document: String,
          slug: String,
          title: String,
          version: String,
          description: String,
          is_private: T::Boolean,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace:,
        document:,
        slug:,
        title:,
        version:,
        description: nil,
        is_private: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            document: String,
            slug: String,
            title: String,
            version: String,
            description: String,
            is_private: T::Boolean,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
