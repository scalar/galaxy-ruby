# typed: strong

module Scalar
  module Models
    class ScalarDocPublishGuideResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::ScalarDocPublishGuideResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :publish_uid

      sig { params(publish_uid: String).returns(T.attached_class) }
      def self.new(publish_uid:)
      end

      sig { override.returns({ publish_uid: String }) }
      def to_hash
      end
    end
  end
end
