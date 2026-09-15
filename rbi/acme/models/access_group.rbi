# typed: strong

module Scalar
  module Models
    class AccessGroup < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Scalar::AccessGroup, Scalar::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :access_group_slug

      sig { params(access_group_slug: String).returns(T.attached_class) }
      def self.new(access_group_slug:)
      end

      sig { override.returns({ access_group_slug: String }) }
      def to_hash
      end
    end
  end
end
