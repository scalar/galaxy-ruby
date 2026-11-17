# typed: strong

module ScalarGalaxy
  module Models
    class Credentials < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ScalarGalaxy::Credentials, ScalarGalaxy::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :email

      # Credentials to authenticate a user
      sig { params(email: String).returns(T.attached_class) }
      def self.new(email:)
      end

      sig { override.returns({ email: String, password: String }) }
      def to_hash
      end
    end
  end
end
