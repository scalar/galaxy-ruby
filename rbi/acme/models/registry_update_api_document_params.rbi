# typed: strong

module Scalar
  module Models
    class RegistryUpdateAPIDocumentParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scalar::RegistryUpdateAPIDocumentParams,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :namespace

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private

      sig { params(is_private: T::Boolean).void }
      attr_writer :is_private

      sig { returns(T.nilable(String)) }
      attr_reader :ruleset

      sig { params(ruleset: String).void }
      attr_writer :ruleset

      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          namespace: String,
          slug: String,
          description: String,
          is_private: T::Boolean,
          ruleset: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace:,
        slug:,
        description: nil,
        is_private: nil,
        ruleset: nil,
        title: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            slug: String,
            description: String,
            is_private: T::Boolean,
            ruleset: String,
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
