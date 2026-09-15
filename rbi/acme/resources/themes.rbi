# typed: strong

module Scalar
  module Resources
    # Themes
    class Themes
      # Create a team theme.
      sig do
        params(
          document: String,
          name: String,
          slug: String,
          description: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::UID)
      end
      def create(document:, name:, slug:, description: nil, request_options: {})
      end

      # Get the theme document by slug.
      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(String)
      end
      def retrieve(slug, request_options: {})
      end

      # Update theme metadata.
      sig do
        params(
          slug: String,
          description: String,
          name: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def update(slug, description: nil, name: nil, request_options: {})
      end

      # List all team themes.
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(
          T::Array[Scalar::Models::ThemeListResponseItem]
        )
      end
      def list(request_options: {})
      end

      # Delete a theme by slug.
      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(slug, request_options: {})
      end

      # Replace the theme document.
      sig do
        params(
          slug: String,
          document: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def replace_document(slug, document:, request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
