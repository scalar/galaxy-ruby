# typed: strong

module Scalar
  module Models
    class ScalarDocCreateGuideParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Scalar::ScalarDocCreateGuideParams, Scalar::Internal::AnyHash)
        end

      sig { returns(T::Array[String]) }
      attr_accessor :allowed_domains

      sig { returns(T::Array[String]) }
      attr_accessor :allowed_users

      sig { returns(T::Boolean) }
      attr_accessor :is_private

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_reader :slug

      sig { params(slug: String).void }
      attr_writer :slug

      sig do
        params(
          allowed_domains: T::Array[String],
          allowed_users: T::Array[String],
          is_private: T::Boolean,
          name: String,
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        allowed_domains:,
        allowed_users:,
        is_private:,
        name:,
        slug: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allowed_domains: T::Array[String],
            allowed_users: T::Array[String],
            is_private: T::Boolean,
            name: String,
            slug: String,
            request_options: Scalar::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
