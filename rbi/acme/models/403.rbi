# typed: strong

module Scalar
  module Models
    class Value403 < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Scalar::Value403, Scalar::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :code

      sig { returns(String) }
      attr_accessor :message

      sig { params(code: String, message: String).returns(T.attached_class) }
      def self.new(code:, message:)
      end

      sig { override.returns({ code: String, message: String }) }
      def to_hash
      end
    end
  end
end
