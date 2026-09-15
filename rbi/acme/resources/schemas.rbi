# typed: strong

module Scalar
  module Resources
    # Schemas
    class Schemas
      # Schemas
      sig { returns(Scalar::Resources::Schemas::Version) }
      attr_reader :version

      # Schemas
      sig { returns(Scalar::Resources::Schemas::AccessGroup) }
      attr_reader :access_group

      # Create a schema in a namespace.
      sig do
        params(
          namespace: String,
          document: String,
          slug: String,
          title: String,
          version: String,
          description: String,
          is_private: T::Boolean,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::UID)
      end
      def create(
        namespace,
        document:,
        slug:,
        title:,
        version:,
        description: nil,
        is_private: nil,
        request_options: {}
      )
      end

      # Update schema metadata.
      sig do
        params(
          slug: String,
          namespace: String,
          description: String,
          is_private: T::Boolean,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def update(
        # Path param
        slug,
        # Path param
        namespace:,
        # Body param
        description: nil,
        # Body param
        is_private: nil,
        # Body param
        title: nil,
        request_options: {}
      )
      end

      # List schemas in a namespace.
      sig do
        params(
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T::Array[Scalar::Models::SchemaListResponseItem])
      end
      def list(namespace, request_options: {})
      end

      # Delete a schema and all related versions.
      sig do
        params(
          slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(slug, namespace:, request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
