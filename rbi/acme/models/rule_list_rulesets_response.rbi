# typed: strong

module Scalar
  module Models
    class RuleListRulesetsResponseItem < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::RuleListRulesetsResponseItem,
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

      sig do
        params(
          description: String,
          is_private: T::Boolean,
          namespace: String,
          slug: String,
          title: String,
          uid: String
        ).returns(T.attached_class)
      end
      def self.new(description:, is_private:, namespace:, slug:, title:, uid:)
      end

      sig do
        override.returns(
          {
            description: String,
            is_private: T::Boolean,
            namespace: String,
            slug: String,
            title: String,
            uid: String
          }
        )
      end
      def to_hash
      end
    end

    RuleListRulesetsResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[
          Scalar::Models::RuleListRulesetsResponseItem
        ],
        Scalar::Internal::Type::Converter
      )
  end
end
