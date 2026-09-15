# frozen_string_literal: true

module Scalar
  module Resources
    # Registry
    class Registry
      # Create an API document.
      #
      # @overload create_api_document(namespace, document:, slug:, title:, version:, description: nil, is_private: nil, ruleset: nil, request_options: {})
      #
      # @param namespace [String]
      # @param document [String]
      # @param slug [String]
      # @param title [String]
      # @param version [String]
      # @param description [String]
      # @param is_private [Boolean]
      # @param ruleset [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::RegistryCreateAPIDocumentResponse]
      #
      # @see Scalar::Models::RegistryCreateAPIDocumentParams
      def create_api_document(namespace, params)
        parsed, options = Scalar::RegistryCreateAPIDocumentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/apis/%1$s", namespace],
          body: parsed,
          model: Scalar::Models::RegistryCreateAPIDocumentResponse,
          options: options
        )
      end

      # Add an access group to an API document.
      #
      # @overload create_api_document_access_group(slug, access_group_slug:, namespace:, request_options: {})
      #
      # @param slug [String] Path param
      #
      # @param access_group_slug [String] Body param
      #
      # @param namespace [String] Path param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RegistryCreateAPIDocumentAccessGroupParams
      def create_api_document_access_group(slug, params)
        parsed, options = Scalar::RegistryCreateAPIDocumentAccessGroupParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :post,
          path: ["v1/apis/%1$s/%2$s/access-group", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Create a new API document version.
      #
      # @overload create_api_document_version(slug, namespace:, document:, version:, force: nil, last_known_version_sha: nil, request_options: {})
      #
      # @param slug [String] Path param
      #
      # @param namespace [String] Path param
      #
      # @param document [String] Body param
      #
      # @param version [String] Body param
      #
      # @param force [Boolean] Body param
      #
      # @param last_known_version_sha [String] Body param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::ManagedDocVersion]
      #
      # @see Scalar::Models::RegistryCreateAPIDocumentVersionParams
      def create_api_document_version(slug, params)
        parsed, options = Scalar::RegistryCreateAPIDocumentVersionParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :post,
          path: ["v1/apis/%1$s/%2$s/version", namespace, slug],
          body: parsed,
          model: Scalar::ManagedDocVersion,
          options: options
        )
      end

      # Delete an API document and all versions.
      #
      # @overload delete_api_document(slug, namespace:, request_options: {})
      #
      # @param slug [String]
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RegistryDeleteAPIDocumentParams
      def delete_api_document(slug, params)
        parsed, options = Scalar::RegistryDeleteAPIDocumentParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/apis/%1$s/%2$s", namespace, slug],
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Remove an access group from an API document.
      #
      # @overload delete_api_document_access_group(slug, access_group_slug:, namespace:, request_options: {})
      #
      # @param slug [String] Path param
      #
      # @param access_group_slug [String] Body param
      #
      # @param namespace [String] Path param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RegistryDeleteAPIDocumentAccessGroupParams
      def delete_api_document_access_group(slug, params)
        parsed, options = Scalar::RegistryDeleteAPIDocumentAccessGroupParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/apis/%1$s/%2$s/access-group", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Delete a specific API document version.
      #
      # @overload delete_api_document_version(semver, namespace:, slug:, request_options: {})
      #
      # @param semver [String]
      # @param namespace [String]
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RegistryDeleteAPIDocumentVersionParams
      def delete_api_document_version(semver, params)
        parsed, options = Scalar::RegistryDeleteAPIDocumentVersionParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/apis/%1$s/%2$s/version/%3$s", namespace, slug, semver],
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # List all API documents across every namespace the caller can access.
      #
      # @overload list_all_api_documents(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::RegistryListAllAPIDocumentsResponseItem>]
      #
      # @see Scalar::Models::RegistryListAllAPIDocumentsParams
      def list_all_api_documents(params = {})
        @client.request(
          method: :get,
          path: "v1/apis",
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::RegistryListAllAPIDocumentsResponseItem],
          options: params[:request_options]
        )
      end

      # Get metadata (uid, content shas, version sha, tags) for a specific API document
      # version.
      #
      # @overload list_api_document_version_metadata(semver, namespace:, slug:, request_options: {})
      #
      # @param semver [String]
      # @param namespace [String]
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::ManagedDocVersion]
      #
      # @see Scalar::Models::RegistryListAPIDocumentVersionMetadataParams
      def list_api_document_version_metadata(semver, params)
        parsed, options = Scalar::RegistryListAPIDocumentVersionMetadataParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :get,
          path: ["v1/apis/%1$s/%2$s/version/%3$s/metadata", namespace, slug, semver],
          model: Scalar::ManagedDocVersion,
          options: options
        )
      end

      # List API documents in a namespace.
      #
      # @overload list_api_documents(namespace, request_options: {})
      #
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::RegistryListAPIDocumentsResponseItem>]
      #
      # @see Scalar::Models::RegistryListAPIDocumentsParams
      def list_api_documents(namespace, params = {})
        @client.request(
          method: :get,
          path: ["v1/apis/%1$s", namespace],
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::RegistryListAPIDocumentsResponseItem],
          options: params[:request_options]
        )
      end

      # Get a specific API document version.
      #
      # @overload retrieve_api_document_version(semver, namespace:, slug:, request_options: {})
      #
      # @param semver [String]
      # @param namespace [String]
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Scalar::Models::RegistryRetrieveAPIDocumentVersionParams
      def retrieve_api_document_version(semver, params)
        parsed, options = Scalar::RegistryRetrieveAPIDocumentVersionParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :get,
          path: ["v1/apis/%1$s/%2$s/version/%3$s", namespace, slug, semver],
          headers: {
            "accept" => "text/plain"
          },
          model: String,
          options: options
        )
      end

      # Update metadata for an API document.
      #
      # @overload update_api_document(slug, namespace:, description: nil, is_private: nil, ruleset: nil, title: nil, request_options: {})
      #
      # @param slug [String] Path param
      #
      # @param namespace [String] Path param
      #
      # @param description [String] Body param
      #
      # @param is_private [Boolean] Body param
      #
      # @param ruleset [String] Body param
      #
      # @param title [String] Body param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RegistryUpdateAPIDocumentParams
      def update_api_document(slug, params)
        parsed, options = Scalar::RegistryUpdateAPIDocumentParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :patch,
          path: ["v1/apis/%1$s/%2$s", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Update the registry file content for an API document version.
      #
      # @overload update_api_document_version(semver, namespace:, slug:, document:, last_known_version_sha: nil, request_options: {})
      #
      # @param semver [String] Path param
      #
      # @param namespace [String] Path param
      #
      # @param slug [String] Path param
      #
      # @param document [String] Body param
      #
      # @param last_known_version_sha [String] Body param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::RegistryUpdateAPIDocumentVersionResponse]
      #
      # @see Scalar::Models::RegistryUpdateAPIDocumentVersionParams
      def update_api_document_version(semver, params)
        parsed, options = Scalar::RegistryUpdateAPIDocumentVersionParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :patch,
          path: ["v1/apis/%1$s/%2$s/version/%3$s", namespace, slug, semver],
          body: parsed,
          model: Scalar::Models::RegistryUpdateAPIDocumentVersionResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Scalar::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
