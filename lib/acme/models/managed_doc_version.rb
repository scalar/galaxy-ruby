# frozen_string_literal: true

module Scalar
  module Models
    class ManagedDocVersion < Scalar::Internal::Type::BaseModel
      # @!attribute created_at
      #
      #   @return [Float]
      required :created_at, Float, api_name: :createdAt

      # @!attribute embed_status
      #
      #   @return [Symbol, Scalar::Models::ManagedDocVersion::EmbedStatus, nil]
      required :embed_status,
               enum: -> { Scalar::ManagedDocVersion::EmbedStatus },
               api_name: :embedStatus,
               nil?: true

      # @!attribute tags
      #
      #   @return [Array<String>]
      required :tags, Scalar::Internal::Type::ArrayOf[String]

      # @!attribute uid
      #
      #   @return [String]
      required :uid, String

      # @!attribute upgraded
      #
      #   @return [Boolean]
      required :upgraded, Scalar::Internal::Type::Boolean

      # @!attribute version
      #
      #   @return [String]
      required :version, String

      # @!attribute json_sha
      #
      #   @return [String, nil]
      optional :json_sha, String, api_name: :jsonSha

      # @!attribute tools
      #
      #   @return [Array<Scalar::Models::ManagedDocVersion::Tool>, nil]
      optional :tools, -> { Scalar::Internal::Type::ArrayOf[Scalar::ManagedDocVersion::Tool] }

      # @!attribute version_sha
      #
      #   @return [String, nil]
      optional :version_sha, String, api_name: :versionSha

      # @!attribute yaml_sha
      #
      #   @return [String, nil]
      optional :yaml_sha, String, api_name: :yamlSha

      # @!method initialize(created_at:, embed_status:, tags:, uid:, upgraded:, version:, json_sha: nil, tools: nil, version_sha: nil, yaml_sha: nil)
      #   @param created_at [Float]
      #   @param embed_status [Symbol, Scalar::Models::ManagedDocVersion::EmbedStatus, nil]
      #   @param tags [Array<String>]
      #   @param uid [String]
      #   @param upgraded [Boolean]
      #   @param version [String]
      #   @param json_sha [String]
      #   @param tools [Array<Scalar::Models::ManagedDocVersion::Tool>]
      #   @param version_sha [String]
      #   @param yaml_sha [String]

      # @see Scalar::Models::ManagedDocVersion#embed_status
      module EmbedStatus
        extend Scalar::Internal::Type::Enum

        COMPLETE = :complete
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Tool < Scalar::Internal::Type::BaseModel
        # @!attribute enabled_tools
        #
        #   @return [Array<Symbol, Scalar::Models::ManagedDocVersion::Tool::EnabledTool>]
        required :enabled_tools,
                 -> { Scalar::Internal::Type::ArrayOf[enum: Scalar::ManagedDocVersion::Tool::EnabledTool] },
                 api_name: :enabledTools

        # @!attribute method_
        #
        #   @return [Symbol, Scalar::Models::ManagedDocVersion::Tool::Method]
        required :method_, enum: -> { Scalar::ManagedDocVersion::Tool::Method }, api_name: :method

        # @!attribute path
        #
        #   @return [String]
        required :path, String

        # @!method initialize(enabled_tools:, method_:, path:)
        #   @param enabled_tools [Array<Symbol, Scalar::Models::ManagedDocVersion::Tool::EnabledTool>]
        #   @param method_ [Symbol, Scalar::Models::ManagedDocVersion::Tool::Method]
        #   @param path [String]

        module EnabledTool
          extend Scalar::Internal::Type::Enum

          EXECUTE_REQUEST = :"execute-request"
          GET_MINI_OPENAPI_SPEC = :"get-mini-openapi-spec"

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Scalar::Models::ManagedDocVersion::Tool#method_
        module Method
          extend Scalar::Internal::Type::Enum

          DELETE = :delete
          GET = :get
          HEAD = :head
          OPTIONS = :options
          PATCH = :patch
          POST = :post
          PUT = :put
          TRACE = :trace

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
