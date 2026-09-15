# typed: strong

module Scalar
  module Models
    class RuleUpdateRulesetParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::RuleUpdateRulesetParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :path_namespace

      sig { returns(String) }
      attr_accessor :path_slug

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private

      sig { params(is_private: T::Boolean).void }
      attr_writer :is_private

      sig { returns(T.nilable(String)) }
      attr_reader :body_namespace

      sig { params(body_namespace: String).void }
      attr_writer :body_namespace

      sig { returns(T.nilable(String)) }
      attr_reader :body_slug

      sig { params(body_slug: String).void }
      attr_writer :body_slug

      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          path_namespace: String,
          path_slug: String,
          description: String,
          is_private: T::Boolean,
          body_namespace: String,
          body_slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        path_namespace:,
        path_slug:,
        description: nil,
        is_private: nil,
        body_namespace: nil,
        body_slug: nil,
        title: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            path_namespace: String,
            path_slug: String,
            description: String,
            is_private: T::Boolean,
            body_namespace: String,
            body_slug: String,
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
