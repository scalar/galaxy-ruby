# typed: strong

module ScalarGalaxy
  module Models
    class AuthenticationCreateUserParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::AuthenticationCreateUserParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :email

      sig { returns(String) }
      attr_accessor :password

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          email: String,
          password: String,
          name: String,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(email:, password:, name: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            email: String,
            password: String,
            name: String,
            request_options: ScalarGalaxy::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
