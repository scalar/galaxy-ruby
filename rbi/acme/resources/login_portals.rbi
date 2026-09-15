# typed: strong

module Scalar
  module Resources
    # Login Portals
    class LoginPortals
      # Create a login portal for the current team.
      sig do
        params(
          email: Scalar::LoginPortalEmail::OrHash,
          page: Scalar::LoginPortalPage::OrHash,
          slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::UID)
      end
      def create(email:, page:, slug:, title:, request_options: {})
      end

      # Get a login portal by slug.
      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::LoginPortalRetrieveResponse)
      end
      def retrieve(slug, request_options: {})
      end

      # Update metadata for a login portal.
      sig do
        params(
          slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def update(slug, title: nil, request_options: {})
      end

      # List all login portals for the current team.
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(
          T::Array[Scalar::Models::LoginPortalListResponseItem]
        )
      end
      def list(request_options: {})
      end

      # Delete a login portal.
      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(slug, request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
