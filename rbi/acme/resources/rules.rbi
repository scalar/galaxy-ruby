# typed: strong

module Scalar
  module Resources
    # Rules
    class Rules
      # Create a rule in a namespace.
      sig do
        params(
          namespace: String,
          document: String,
          slug: String,
          title: String,
          description: String,
          is_private: T::Boolean,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(Scalar::UID)
      end
      def create_ruleset(
        namespace,
        document:,
        slug:,
        title:,
        description: nil,
        is_private: nil,
        request_options: {}
      )
      end

      # Grant an access group to a rule.
      sig do
        params(
          slug: String,
          access_group_slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def create_ruleset_access_group(
        # Path param
        slug,
        # Body param
        access_group_slug:,
        # Path param
        namespace:,
        request_options: {}
      )
      end

      # Delete a rule by slug.
      sig do
        params(
          slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete_ruleset(slug, namespace:, request_options: {})
      end

      # Remove an access group from a rule.
      sig do
        params(
          slug: String,
          access_group_slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete_ruleset_access_group(
        # Path param
        slug,
        # Body param
        access_group_slug:,
        # Path param
        namespace:,
        request_options: {}
      )
      end

      # List all rulesets in a namespace.
      sig do
        params(
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T::Array[Scalar::Models::RuleListRulesetsResponseItem])
      end
      def list_rulesets(namespace, request_options: {})
      end

      # Get a rule document by slug.
      sig do
        params(
          slug: String,
          namespace: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(String)
      end
      def retrieve_ruleset_document(slug, namespace:, request_options: {})
      end

      # Update rule metadata by slug.
      sig do
        params(
          path_slug: String,
          path_namespace: String,
          description: String,
          is_private: T::Boolean,
          body_namespace: String,
          body_slug: String,
          title: String,
          request_options: Scalar::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def update_ruleset(
        # Path param
        path_slug,
        # Path param
        path_namespace:,
        # Body param
        description: nil,
        # Body param
        is_private: nil,
        # Body param
        body_namespace: nil,
        # Body param
        body_slug: nil,
        # Body param
        title: nil,
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
