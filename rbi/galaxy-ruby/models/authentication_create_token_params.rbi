# typed: strong

module ScalarGalaxy
  module Models
    class AuthenticationCreateTokenParams < ScalarGalaxy::Models::Credentials
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::AuthenticationCreateTokenParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :password

      sig do
        params(
          password: String,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(password:, request_options: {})
      end

      sig do
        override.returns(
          { password: String, request_options: ScalarGalaxy::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
