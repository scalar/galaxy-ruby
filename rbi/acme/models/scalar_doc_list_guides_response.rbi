# typed: strong

module Scalar
  module Models
    class ScalarDocListGuidesResponseItem < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Scalar::Models::ScalarDocListGuidesResponseItem,
            Scalar::Internal::AnyHash
          )
        end

      sig { returns(T.anything) }
      attr_accessor :access_groups

      sig do
        returns(
          T.nilable(
            Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment
          )
        )
      end
      attr_reader :active_deployment

      sig do
        params(
          active_deployment:
            T.nilable(
              Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment::OrHash
            )
        ).void
      end
      attr_writer :active_deployment

      sig { returns(String) }
      attr_accessor :active_theme_id

      sig { returns(T::Boolean) }
      attr_accessor :agent_enabled

      sig { returns(Integer) }
      attr_accessor :created_at

      sig { returns(T::Boolean) }
      attr_accessor :is_private

      sig { returns(T.nilable(Integer)) }
      attr_accessor :last_published

      sig { returns(T.nilable(String)) }
      attr_accessor :last_published_uid

      sig { returns(String) }
      attr_accessor :login_portal_uid

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :publish_message

      sig { returns(String) }
      attr_accessor :publish_status

      sig { returns(String) }
      attr_accessor :slug

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(Integer) }
      attr_accessor :updated_at

      sig do
        returns(
          T.nilable(Scalar::Models::ScalarDocListGuidesResponseItem::Repository)
        )
      end
      attr_reader :repository

      sig do
        params(
          repository:
            T.nilable(
              Scalar::Models::ScalarDocListGuidesResponseItem::Repository::OrHash
            )
        ).void
      end
      attr_writer :repository

      sig { returns(T.nilable(Float)) }
      attr_reader :typesense_id

      sig { params(typesense_id: Float).void }
      attr_writer :typesense_id

      sig do
        params(
          access_groups: T.anything,
          active_deployment:
            T.nilable(
              Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment::OrHash
            ),
          active_theme_id: String,
          agent_enabled: T::Boolean,
          created_at: Integer,
          is_private: T::Boolean,
          last_published: T.nilable(Integer),
          last_published_uid: T.nilable(String),
          login_portal_uid: String,
          name: String,
          publish_message: String,
          publish_status: String,
          slug: String,
          uid: String,
          updated_at: Integer,
          repository:
            T.nilable(
              Scalar::Models::ScalarDocListGuidesResponseItem::Repository::OrHash
            ),
          typesense_id: Float
        ).returns(T.attached_class)
      end
      def self.new(
        access_groups:,
        active_deployment:,
        active_theme_id:,
        agent_enabled:,
        created_at:,
        is_private:,
        last_published:,
        last_published_uid:,
        login_portal_uid:,
        name:,
        publish_message:,
        publish_status:,
        slug:,
        uid:,
        updated_at:,
        repository: nil,
        typesense_id: nil
      )
      end

      sig do
        override.returns(
          {
            access_groups: T.anything,
            active_deployment:
              T.nilable(
                Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment
              ),
            active_theme_id: String,
            agent_enabled: T::Boolean,
            created_at: Integer,
            is_private: T::Boolean,
            last_published: T.nilable(Integer),
            last_published_uid: T.nilable(String),
            login_portal_uid: String,
            name: String,
            publish_message: String,
            publish_status: String,
            slug: String,
            uid: String,
            updated_at: Integer,
            repository:
              T.nilable(
                Scalar::Models::ScalarDocListGuidesResponseItem::Repository
              ),
            typesense_id: Float
          }
        )
      end
      def to_hash
      end

      class ActiveDeployment < Scalar::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :domain

        sig { returns(Integer) }
        attr_accessor :published_at

        sig { returns(String) }
        attr_accessor :uid

        sig do
          params(domain: String, published_at: Integer, uid: String).returns(
            T.attached_class
          )
        end
        def self.new(domain:, published_at:, uid:)
        end

        sig do
          override.returns(
            { domain: String, published_at: Integer, uid: String }
          )
        end
        def to_hash
        end
      end

      class Repository < Scalar::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Scalar::Models::ScalarDocListGuidesResponseItem::Repository,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(Float) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :branch

        sig { returns(String) }
        attr_accessor :config_path

        sig { returns(T::Boolean) }
        attr_accessor :expired

        sig { returns(String) }
        attr_accessor :linked_by

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Boolean) }
        attr_accessor :pr_comments

        sig { returns(T::Boolean) }
        attr_accessor :publish_on_merge

        sig { returns(T::Boolean) }
        attr_accessor :publish_previews

        sig do
          params(
            id: Float,
            branch: String,
            config_path: String,
            expired: T::Boolean,
            linked_by: String,
            name: String,
            pr_comments: T::Boolean,
            publish_on_merge: T::Boolean,
            publish_previews: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          branch:,
          config_path:,
          expired:,
          linked_by:,
          name:,
          pr_comments:,
          publish_on_merge:,
          publish_previews:
        )
        end

        sig do
          override.returns(
            {
              id: Float,
              branch: String,
              config_path: String,
              expired: T::Boolean,
              linked_by: String,
              name: String,
              pr_comments: T::Boolean,
              publish_on_merge: T::Boolean,
              publish_previews: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end

    ScalarDocListGuidesResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[
          Scalar::Models::ScalarDocListGuidesResponseItem
        ],
        Scalar::Internal::Type::Converter
      )
  end
end
