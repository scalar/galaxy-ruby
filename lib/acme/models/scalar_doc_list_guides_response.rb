# frozen_string_literal: true

module Scalar
  module Models
    class ScalarDocListGuidesResponseItem < Scalar::Internal::Type::BaseModel
      # @!attribute access_groups
      #
      #   @return [Object]
      required :access_groups, Scalar::Internal::Type::Unknown, api_name: :accessGroups

      # @!attribute active_deployment
      #
      #   @return [Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment, nil]
      required :active_deployment,
               -> { Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment },
               api_name: :activeDeployment,
               nil?: true

      # @!attribute active_theme_id
      #
      #   @return [String]
      required :active_theme_id, String, api_name: :activeThemeId

      # @!attribute agent_enabled
      #
      #   @return [Boolean]
      required :agent_enabled, Scalar::Internal::Type::Boolean, api_name: :agentEnabled

      # @!attribute created_at
      #
      #   @return [Integer]
      required :created_at, Integer, api_name: :createdAt

      # @!attribute is_private
      #
      #   @return [Boolean]
      required :is_private, Scalar::Internal::Type::Boolean, api_name: :isPrivate

      # @!attribute last_published
      #
      #   @return [Integer, nil]
      required :last_published, Integer, api_name: :lastPublished, nil?: true

      # @!attribute last_published_uid
      #
      #   @return [String, nil]
      required :last_published_uid, String, api_name: :lastPublishedUid, nil?: true

      # @!attribute login_portal_uid
      #
      #   @return [String]
      required :login_portal_uid, String, api_name: :loginPortalUid

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute publish_message
      #
      #   @return [String]
      required :publish_message, String, api_name: :publishMessage

      # @!attribute publish_status
      #
      #   @return [String]
      required :publish_status, String, api_name: :publishStatus

      # @!attribute slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute updated_at
      #
      #   @return [Integer]
      required :updated_at, Integer, api_name: :updatedAt

      # @!attribute repository
      #
      #   @return [Scalar::Models::ScalarDocListGuidesResponseItem::Repository, nil]
      optional :repository, -> { Scalar::Models::ScalarDocListGuidesResponseItem::Repository }, nil?: true

      # @!attribute typesense_id
      #
      #   @return [Float, nil]
      optional :typesense_id, Float, api_name: :typesenseId

      # @!method initialize(access_groups:, active_deployment:, active_theme_id:, agent_enabled:, created_at:, is_private:, last_published:, last_published_uid:, login_portal_uid:, name:, publish_message:, publish_status:, slug:, uid:, updated_at:, repository: nil, typesense_id: nil)
      #   @param access_groups [Object]
      #   @param active_deployment [Scalar::Models::ScalarDocListGuidesResponseItem::ActiveDeployment, nil]
      #   @param active_theme_id [String]
      #   @param agent_enabled [Boolean]
      #   @param created_at [Integer]
      #   @param is_private [Boolean]
      #   @param last_published [Integer, nil]
      #   @param last_published_uid [String, nil]
      #   @param login_portal_uid [String]
      #   @param name [String]
      #   @param publish_message [String]
      #   @param publish_status [String]
      #   @param slug [String]
      #   @param uid [String]
      #   @param updated_at [Integer]
      #   @param repository [Scalar::Models::ScalarDocListGuidesResponseItem::Repository, nil]
      #   @param typesense_id [Float]

      # @see Scalar::Models::ScalarDocListGuidesResponseItem#active_deployment
      class ActiveDeployment < Scalar::Internal::Type::BaseModel
        # @!attribute domain
        #
        #   @return [String]
        required :domain, String

        # @!attribute published_at
        #
        #   @return [Integer]
        required :published_at, Integer, api_name: :publishedAt

        # @!attribute uid
        #
        #   @return [String]
        required :uid, String

        # @!method initialize(domain:, published_at:, uid:)
        #   @param domain [String]
        #   @param published_at [Integer]
        #   @param uid [String]
      end

      # @see Scalar::Models::ScalarDocListGuidesResponseItem#repository
      class Repository < Scalar::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Float]
        required :id, Float

        # @!attribute branch
        #
        #   @return [String]
        required :branch, String

        # @!attribute config_path
        #
        #   @return [String]
        required :config_path, String, api_name: :configPath

        # @!attribute expired
        #
        #   @return [Boolean]
        required :expired, Scalar::Internal::Type::Boolean

        # @!attribute linked_by
        #
        #   @return [String]
        required :linked_by, String, api_name: :linkedBy

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute pr_comments
        #
        #   @return [Boolean]
        required :pr_comments, Scalar::Internal::Type::Boolean, api_name: :prComments

        # @!attribute publish_on_merge
        #
        #   @return [Boolean]
        required :publish_on_merge, Scalar::Internal::Type::Boolean, api_name: :publishOnMerge

        # @!attribute publish_previews
        #
        #   @return [Boolean]
        required :publish_previews, Scalar::Internal::Type::Boolean, api_name: :publishPreviews

        # @!method initialize(id:, branch:, config_path:, expired:, linked_by:, name:, pr_comments:, publish_on_merge:, publish_previews:)
        #   @param id [Float]
        #   @param branch [String]
        #   @param config_path [String]
        #   @param expired [Boolean]
        #   @param linked_by [String]
        #   @param name [String]
        #   @param pr_comments [Boolean]
        #   @param publish_on_merge [Boolean]
        #   @param publish_previews [Boolean]
      end
    end

    # @type [Scalar::Internal::Type::Converter]
    ScalarDocListGuidesResponse =
      Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::ScalarDocListGuidesResponseItem }]
  end
end
