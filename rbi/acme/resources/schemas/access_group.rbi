# typed: strong

module Scalar
  module Resources
    class Schemas
      # Schemas
      class AccessGroup
        # Add an access group to a schema.
        sig do
          params(
            slug: String,
            access_group_slug: String,
            namespace: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(T.anything)
        end
        def create(
          # Path param
          slug,
          # Body param
          access_group_slug:,
          # Path param
          namespace:,
          request_options: {}
        )
        end

        # Remove an access group from a schema.
        sig do
          params(
            slug: String,
            access_group_slug: String,
            namespace: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(T.anything)
        end
        def delete(
          # Path param
          slug,
          # Body param
          access_group_slug:,
          # Path param
          namespace:,
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
end
