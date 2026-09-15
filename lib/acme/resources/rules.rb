# frozen_string_literal: true

module Scalar
  module Resources
    # Rules
    class Rules
      # Create a rule in a namespace.
      #
      # @overload create_ruleset(namespace, document:, slug:, title:, description: nil, is_private: nil, request_options: {})
      #
      # @param namespace [String]
      # @param document [String]
      # @param slug [String]
      # @param title [String]
      # @param description [String]
      # @param is_private [Boolean]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::UID]
      #
      # @see Scalar::Models::RuleCreateRulesetParams
      def create_ruleset(namespace, params)
        parsed, options = Scalar::RuleCreateRulesetParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/rulesets/%1$s", namespace],
          body: parsed,
          model: Scalar::UID,
          options: options
        )
      end

      # Grant an access group to a rule.
      #
      # @overload create_ruleset_access_group(slug, access_group_slug:, namespace:, request_options: {})
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
      # @see Scalar::Models::RuleCreateRulesetAccessGroupParams
      def create_ruleset_access_group(slug, params)
        parsed, options = Scalar::RuleCreateRulesetAccessGroupParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :post,
          path: ["v1/rulesets/%1$s/%2$s/access-group", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Delete a rule by slug.
      #
      # @overload delete_ruleset(slug, namespace:, request_options: {})
      #
      # @param slug [String]
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RuleDeleteRulesetParams
      def delete_ruleset(slug, params)
        parsed, options = Scalar::RuleDeleteRulesetParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/rulesets/%1$s/%2$s", namespace, slug],
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # Remove an access group from a rule.
      #
      # @overload delete_ruleset_access_group(slug, access_group_slug:, namespace:, request_options: {})
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
      # @see Scalar::Models::RuleDeleteRulesetAccessGroupParams
      def delete_ruleset_access_group(slug, params)
        parsed, options = Scalar::RuleDeleteRulesetAccessGroupParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/rulesets/%1$s/%2$s/access-group", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # List all rulesets in a namespace.
      #
      # @overload list_rulesets(namespace, request_options: {})
      #
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::RuleListRulesetsResponseItem>]
      #
      # @see Scalar::Models::RuleListRulesetsParams
      def list_rulesets(namespace, params = {})
        @client.request(
          method: :get,
          path: ["v1/rulesets/%1$s", namespace],
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::RuleListRulesetsResponseItem],
          options: params[:request_options]
        )
      end

      # Get a rule document by slug.
      #
      # @overload retrieve_ruleset_document(slug, namespace:, request_options: {})
      #
      # @param slug [String]
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Scalar::Models::RuleRetrieveRulesetDocumentParams
      def retrieve_ruleset_document(slug, params)
        parsed, options = Scalar::RuleRetrieveRulesetDocumentParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :get,
          path: ["v1/rulesets/%1$s/%2$s", namespace, slug],
          headers: {
            "accept" => "text/plain"
          },
          model: String,
          options: options
        )
      end

      # Update rule metadata by slug.
      #
      # @overload update_ruleset(path_slug, path_namespace:, description: nil, is_private: nil, body_namespace: nil, body_slug: nil, title: nil, request_options: {})
      #
      # @param path_slug [String] Path param
      #
      # @param path_namespace [String] Path param
      #
      # @param description [String] Body param
      #
      # @param is_private [Boolean] Body param
      #
      # @param body_namespace [String] Body param
      #
      # @param body_slug [String] Body param
      #
      # @param title [String] Body param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::RuleUpdateRulesetParams
      def update_ruleset(path_slug, params)
        parsed, options = Scalar::RuleUpdateRulesetParams.dump_request(params)
        path_namespace =
          parsed.delete(:path_namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :patch,
          path: ["v1/rulesets/%1$s/%2$s", path_namespace, path_slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
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
