# typed: strong

module Scalar
  module Models
    class AuthenticationExchangePersonalTokenParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Scalar::AuthenticationExchangePersonalTokenParams,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :personal_token

      sig do
        params(
          personal_token: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(personal_token:, request_options: {})
      end

      sig do
        override.returns(
          { personal_token: String, request_options: Scalar::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
