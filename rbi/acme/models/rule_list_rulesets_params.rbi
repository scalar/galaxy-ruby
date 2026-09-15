# typed: strong

module Scalar
  module Models
    class RuleListRulesetsParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::RuleListRulesetsParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :namespace

      sig do
        params(
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(namespace:, request_options: {})
      end

      sig do
        override.returns(
          { namespace: String, request_options: Scalar::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
