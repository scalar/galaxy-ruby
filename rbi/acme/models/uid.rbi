# typed: strong

module Scalar
  module Models
    class UID < Scalar::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Scalar::UID, Scalar::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :uid

      sig { params(uid: String).returns(T.attached_class) }
      def self.new(uid:)
      end

      sig { override.returns({ uid: String }) }
      def to_hash
      end
    end
  end
end
