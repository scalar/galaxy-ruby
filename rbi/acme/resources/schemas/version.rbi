# typed: strong

module Scalar
  module Resources
    class Schemas
      # Schemas
      class Version
        # Create a schema version.
        sig do
          params(
            slug: String,
            namespace: String,
            document: String,
            version: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(Scalar::UID)
        end
        def create(
          # Path param
          slug,
          # Path param
          namespace:,
          # Body param
          document:,
          # Body param
          version:,
          request_options: {}
        )
        end

        # Get a specific schema version document.
        sig do
          params(
            semver: String,
            namespace: String,
            slug: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(String)
        end
        def retrieve(semver, namespace:, slug:, request_options: {})
        end

        # Delete a schema version.
        sig do
          params(
            semver: String,
            namespace: String,
            slug: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(T.anything)
        end
        def delete(semver, namespace:, slug:, request_options: {})
        end

        # @api private
        sig { params(client: Scalar::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
