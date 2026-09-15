# typed: strong

module Scalar
  module Resources
    # Scalar Docs
    class ScalarDocs
      # Create a guide project.
      sig do
        params(
          allowed_domains: T::Array[String],
          allowed_users: T::Array[String],
          is_private: T::Boolean,
          name: String,
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::ScalarDocCreateGuideResponse)
      end
      def create_guide(
        allowed_domains:,
        allowed_users:,
        is_private:,
        name:,
        slug: nil,
        request_options: {}
      )
      end

      # List all guide projects.
      sig do
        params(request_options: Scalar::RequestOptions::OrHash).returns(
          T::Array[Scalar::Models::ScalarDocListGuidesResponseItem]
        )
      end
      def list_guides(request_options: {})
      end

      # Start a new publish process.
      sig do
        params(
          slug: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::Models::ScalarDocPublishGuideResponse)
      end
      def publish_guide(slug, request_options: {})
      end

      # @api private
      sig { params(client: Scalar::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
