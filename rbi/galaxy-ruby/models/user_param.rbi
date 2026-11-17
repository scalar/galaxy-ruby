# typed: strong

module ScalarGalaxy
  module Models
    class UserParam < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ScalarGalaxy::UserParam, ScalarGalaxy::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # A user
      sig { params(name: String).returns(T.attached_class) }
      def self.new(name: nil)
      end

      sig { override.returns({ name: String }) }
      def to_hash
      end
    end
  end
end
