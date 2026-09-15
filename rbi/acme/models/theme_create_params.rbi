# typed: strong

module Scalar
  module Models
    class ThemeCreateParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::ThemeCreateParams, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :document

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          document: String,
          name: String,
          slug: String,
          description: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        document:,
        name:,
        slug:,
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            document: String,
            name: String,
            slug: String,
            description: String,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
