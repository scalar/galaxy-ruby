# typed: strong

module Scalar
  module Models
    class AuthenticationExchangePersonalTokenResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::AuthenticationExchangePersonalTokenResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :access_token

      sig { params(access_token: String).returns(T.attached_class) }
      def self.new(access_token:)
      end

      sig { override.returns({ access_token: String }) }
      def to_hash
      end
    end
  end
end
