# typed: strong

module Scalar
  module Models
    class AuthenticationListCurrentUserResponse < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::AuthenticationListCurrentUserResponse,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :active_team_id

      sig { returns(Integer) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :email

      sig { returns(T::Boolean) }
      attr_accessor :has_github

      sig do
        returns(
          T::Array[Scalar::Models::AuthenticationListCurrentUserResponse::Team]
        )
      end
      attr_accessor :teams

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(Integer) }
      attr_accessor :updated_at

      sig { returns(T.nilable(String)) }
      attr_reader :theme

      sig { params(theme: String).void }
      attr_writer :theme

      sig do
        params(
          active_team_id: T.nilable(String),
          created_at: Integer,
          email: String,
          has_github: T::Boolean,
          teams:
            T::Array[
              Scalar::Models::AuthenticationListCurrentUserResponse::Team::OrHash
            ],
          uid: String,
          updated_at: Integer,
          theme: String
        ).returns(T.attached_class)
      end
      def self.new(
        active_team_id:,
        created_at:,
        email:,
        has_github:,
        teams:,
        uid:,
        updated_at:,
        theme: nil
      )
      end

      sig do
        override.returns(
          {
            active_team_id: T.nilable(String),
            created_at: Integer,
            email: String,
            has_github: T::Boolean,
            teams:
              T::Array[
                Scalar::Models::AuthenticationListCurrentUserResponse::Team
              ],
            uid: String,
            updated_at: Integer,
            theme: String
          }
        )
      end
      def to_hash
      end

      class Team < Scalar::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scalar::Models::AuthenticationListCurrentUserResponse::Team,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :uid

        sig { returns(T.nilable(String)) }
        attr_reader :image_uri

        sig { params(image_uri: String).void }
        attr_writer :image_uri

        sig do
          params(name: String, uid: String, image_uri: String).returns(
            T.attached_class
          )
        end
        def self.new(name:, uid:, image_uri: nil)
        end

        sig do
          override.returns({ name: String, uid: String, image_uri: String })
        end
        def to_hash
        end
      end
    end
  end
end
