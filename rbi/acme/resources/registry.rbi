# typed: strong

module Scalar
  module Resources
    # Registry
    class Registry
      # Create an API document.
      sig do
        params(
          namespace: String,
          document: String,
          slug: String,
          title: String,
          version: String,
          description: String,
          is_private: T::Boolean,
          ruleset: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::RegistryCreateAPIDocumentResponse)
      end
      def create_api_document(
        namespace,
        document:,
        slug:,
        title:,
        version:,
        description: nil,
        is_private: nil,
        ruleset: nil,
        request_options: {}
      )
      end

      # Add an access group to an API document.
      sig do
        params(
          slug: String,
          access_group_slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def create_api_document_access_group(
        # Path param
        slug,
        # Body param
        access_group_slug:,
        # Path param
        namespace:,
        request_options: {}
      )
      end

      # Create a new API document version.
      sig do
        params(
          slug: String,
          namespace: String,
          document: String,
          version: String,
          force: T::Boolean,
          last_known_version_sha: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::ManagedDocVersion)
      end
      def create_api_document_version(
        # Path param
        slug,
        # Path param
        namespace:,
        # Body param
        document:,
        # Body param
        version:,
        # Body param
        force: nil,
        # Body param
        last_known_version_sha: nil,
        request_options: {}
      )
      end

      # Delete an API document and all versions.
      sig do
        params(
          slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete_api_document(slug, namespace:, request_options: {})
      end

      # Remove an access group from an API document.
      sig do
        params(
          slug: String,
          access_group_slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete_api_document_access_group(
        # Path param
        slug,
        # Body param
        access_group_slug:,
        # Path param
        namespace:,
        request_options: {}
      )
      end

      # Delete a specific API document version.
      sig do
        params(
          semver: String,
          namespace: String,
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete_api_document_version(
        semver,
        namespace:,
        slug:,
        request_options: {}
      )
      end

      # List all API documents across every namespace the caller can access.
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(
          T::Array[Scalar::Models::RegistryListAllAPIDocumentsResponseItem]
        )
      end
      def list_all_api_documents(request_options: {})
      end

      # Get metadata (uid, content shas, version sha, tags) for a specific API document
      # version.
      sig do
        params(
          semver: String,
          namespace: String,
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::ManagedDocVersion)
      end
      def list_api_document_version_metadata(
        semver,
        namespace:,
        slug:,
        request_options: {}
      )
      end

      # List API documents in a namespace.
      sig do
        params(
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(
          T::Array[Scalar::Models::RegistryListAPIDocumentsResponseItem]
        )
      end
      def list_api_documents(namespace, request_options: {})
      end

      # Get a specific API document version.
      sig do
        params(
          semver: String,
          namespace: String,
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(String)
      end
      def retrieve_api_document_version(
        semver,
        namespace:,
        slug:,
        request_options: {}
      )
      end

      # Update metadata for an API document.
      sig do
        params(
          slug: String,
          namespace: String,
          description: String,
          is_private: T::Boolean,
          ruleset: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def update_api_document(
        # Path param
        slug,
        # Path param
        namespace:,
        # Body param
        description: nil,
        # Body param
        is_private: nil,
        # Body param
        ruleset: nil,
        # Body param
        title: nil,
        request_options: {}
      )
      end

      # Update the registry file content for an API document version.
      sig do
        params(
          semver: String,
          namespace: String,
          slug: String,
          document: String,
          last_known_version_sha: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::RegistryUpdateAPIDocumentVersionResponse)
      end
      def update_api_document_version(
        # Path param
        semver,
        # Path param
        namespace:,
        # Path param
        slug:,
        # Body param
        document:,
        # Body param
        last_known_version_sha: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
