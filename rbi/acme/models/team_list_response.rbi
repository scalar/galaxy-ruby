# typed: strong

module Scalar
  module Models
    class TeamListResponseItem < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Scalar::Models::TeamListResponseItem, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :theme

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(T.nilable(String)) }
      attr_reader :image_uri

      sig { params(image_uri: String).void }
      attr_writer :image_uri

      sig do
        params(
          name: String,
          slug: String,
          theme: String,
          uid: String,
          image_uri: String
        ).returns(T.attached_class)
      end
      def self.new(name:, slug:, theme:, uid:, image_uri: nil)
      end

      sig do
        override.returns(
          {
            name: String,
            slug: String,
            theme: String,
            uid: String,
            image_uri: String
          }
        )
      end
      def to_hash
      end
    end

    TeamListResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[Scalar::Models::TeamListResponseItem],
        Scalar::Internal::Type::Converter
      )
  end
end
