# typed: strong

module Scalar
  module Models
    class ScalarDocCreateGuideResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::ScalarDocCreateGuideResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :uid

      sig { params(slug: String, uid: String).returns(T.attached_class) }
      def self.new(slug:, uid:)
      end

      sig { override.returns({ slug: String, uid: String }) }
      def to_hash
      end
    end
  end
end
