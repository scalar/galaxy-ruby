# typed: strong

module Scalar
  module Models
    class ManagedDocVersion < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Scalar::ManagedDocVersion, Scalar::Internal::AnyHash)
        end

      sig { returns(Float) }
      attr_accessor :created_at

      sig do
        returns(T.nilable(Scalar::ManagedDocVersion::EmbedStatus::TaggedSymbol))
      end
      attr_accessor :embed_status

      sig { returns(T::Array[String]) }
      attr_accessor :tags

      sig { returns(String) }
      attr_accessor :uid

      sig { returns(T::Boolean) }
      attr_accessor :upgraded

      sig { returns(String) }
      attr_accessor :version

      sig { returns(T.nilable(String)) }
      attr_reader :json_sha

      sig { params(json_sha: String).void }
      attr_writer :json_sha

      sig { returns(T.nilable(T::Array[Scalar::ManagedDocVersion::Tool])) }
      attr_reader :tools

      sig do
        params(tools: T::Array[Scalar::ManagedDocVersion::Tool::OrHash]).void
      end
      attr_writer :tools

      sig { returns(T.nilable(String)) }
      attr_reader :version_sha

      sig { params(version_sha: String).void }
      attr_writer :version_sha

      sig { returns(T.nilable(String)) }
      attr_reader :yaml_sha

      sig { params(yaml_sha: String).void }
      attr_writer :yaml_sha

      sig do
        params(
          created_at: Float,
          embed_status:
            T.nilable(Scalar::ManagedDocVersion::EmbedStatus::OrSymbol),
          tags: T::Array[String],
          uid: String,
          upgraded: T::Boolean,
          version: String,
          json_sha: String,
          tools: T::Array[Scalar::ManagedDocVersion::Tool::OrHash],
          version_sha: String,
          yaml_sha: String
        ).returns(T.attached_class)
      end
      def self.new(
        created_at:,
        embed_status:,
        tags:,
        uid:,
        upgraded:,
        version:,
        json_sha: nil,
        tools: nil,
        version_sha: nil,
        yaml_sha: nil
      )
      end

      sig do
        override.returns(
          {
            created_at: Float,
            embed_status:
              T.nilable(Scalar::ManagedDocVersion::EmbedStatus::TaggedSymbol),
            tags: T::Array[String],
            uid: String,
            upgraded: T::Boolean,
            version: String,
            json_sha: String,
            tools: T::Array[Scalar::ManagedDocVersion::Tool],
            version_sha: String,
            yaml_sha: String
          }
        )
      end
      def to_hash
      end

      module EmbedStatus
        extend Scalar::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Scalar::ManagedDocVersion::EmbedStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETE =
          T.let(:complete, Scalar::ManagedDocVersion::EmbedStatus::TaggedSymbol)
        FAILED =
          T.let(:failed, Scalar::ManagedDocVersion::EmbedStatus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Scalar::ManagedDocVersion::EmbedStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Tool < Scalar::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Scalar::ManagedDocVersion::Tool, Scalar::Internal::AnyHash)
          end

        sig do
          returns(
            T::Array[Scalar::ManagedDocVersion::Tool::EnabledTool::TaggedSymbol]
          )
        end
        attr_accessor :enabled_tools

        sig { returns(Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol) }
        attr_accessor :method_

        sig { returns(String) }
        attr_accessor :path

        sig do
          params(
            enabled_tools:
              T::Array[Scalar::ManagedDocVersion::Tool::EnabledTool::OrSymbol],
            method_: Scalar::ManagedDocVersion::Tool::Method::OrSymbol,
            path: String
          ).returns(T.attached_class)
        end
        def self.new(enabled_tools:, method_:, path:)
        end

        sig do
          override.returns(
            {
              enabled_tools:
                T::Array[
                  Scalar::ManagedDocVersion::Tool::EnabledTool::TaggedSymbol
                ],
              method_: Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol,
              path: String
            }
          )
        end
        def to_hash
        end

        module EnabledTool
          extend Scalar::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Scalar::ManagedDocVersion::Tool::EnabledTool)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXECUTE_REQUEST =
            T.let(
              :"execute-request",
              Scalar::ManagedDocVersion::Tool::EnabledTool::TaggedSymbol
            )
          GET_MINI_OPENAPI_SPEC =
            T.let(
              :"get-mini-openapi-spec",
              Scalar::ManagedDocVersion::Tool::EnabledTool::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Scalar::ManagedDocVersion::Tool::EnabledTool::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Method
          extend Scalar::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Scalar::ManagedDocVersion::Tool::Method)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELETE =
            T.let(
              :delete,
              Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol
            )
          GET =
            T.let(:get, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)
          HEAD =
            T.let(:head, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)
          OPTIONS =
            T.let(
              :options,
              Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol
            )
          PATCH =
            T.let(:patch, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)
          POST =
            T.let(:post, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)
          PUT =
            T.let(:put, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)
          TRACE =
            T.let(:trace, Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Scalar::ManagedDocVersion::Tool::Method::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
