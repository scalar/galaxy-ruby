# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Authentication#list_current_user
    class AuthenticationListCurrentUserResponse < Scalar::Internal::Type::BaseModel
      # @!attribute active_team_id
      #
      #   @return [String, nil]
      required :active_team_id, String, api_name: :activeTeamId, nil?: true

      # @!attribute created_at
      #
      #   @return [Integer]
      required :created_at, Integer, api_name: :createdAt

      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!attribute has_github
      #
      #   @return [Boolean]
      required :has_github, Scalar::Internal::Type::Boolean, api_name: :hasGithub

      # @!attribute teams
      #
      #   @return [Array<Scalar::Models::AuthenticationListCurrentUserResponse::Team>]
      required :teams,
               -> do
                 Scalar::Internal::Type::ArrayOf[Scalar::Models::AuthenticationListCurrentUserResponse::Team]
               end

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute updated_at
      #
      #   @return [Integer]
      required :updated_at, Integer, api_name: :updatedAt

      # @!attribute theme
      #
      #   @return [String, nil]
      optional :theme, String

      # @!method initialize(active_team_id:, created_at:, email:, has_github:, teams:, uid:, updated_at:, theme: nil)
      #   @param active_team_id [String, nil]
      #   @param created_at [Integer]
      #   @param email [String]
      #   @param has_github [Boolean]
      #   @param teams [Array<Scalar::Models::AuthenticationListCurrentUserResponse::Team>]
      #   @param uid [String]
      #   @param updated_at [Integer]
      #   @param theme [String]

      class Team < Scalar::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute uid
        #
        #   @return [String]
        required :uid, String

        # @!attribute image_uri
        #
        #   @return [String, nil]
        optional :image_uri, String, api_name: :imageUri

        # @!method initialize(name:, uid:, image_uri: nil)
        #   @param name [String]
        #   @param uid [String]
        #   @param image_uri [String]
      end
    end
  end
end
