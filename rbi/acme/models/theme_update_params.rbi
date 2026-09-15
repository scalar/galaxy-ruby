# typed: strong

module Scalar
  module Models
    class ThemeUpdateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::ThemeUpdateParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          slug: String,
          description: String,
          name: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(slug:, description: nil, name: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            slug: String,
            description: String,
            name: String,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
