# typed: strong

module ScalarGalaxy
  module Models
    class AuthenticationCreateTokenResponse < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::Models::AuthenticationCreateTokenResponse,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :token

      sig { params(token: String).void }
      attr_writer :token

      sig { params(token: String).returns(T.attached_class) }
      def self.new(token: nil)
      end

      sig { override.returns({ token: String }) }
      def to_hash
      end
    end
  end
end
