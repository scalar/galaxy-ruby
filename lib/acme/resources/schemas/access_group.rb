# frozen_string_literal: true

module Scalar
  module Resources
    class Schemas
      # Schemas
      class AccessGroup
        # Add an access group to a schema.
        #
        # @overload create(slug, access_group_slug:, namespace:, request_options: {})
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
        # @see Scalar::Models::Schemas::AccessGroupCreateParams
        def create(slug, params)
          parsed, options = Scalar::Schemas::AccessGroupCreateParams.dump_request(params)
          namespace =
            parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
          @client.request(
            method: :post,
            path: ["v1/schemas/%1$s/%2$s/access-group", namespace, slug],
            body: parsed,
            model: Scalar::Internal::Type::Unknown,
            options: options
          )
        end

        # Remove an access group from a schema.
        #
        # @overload delete(slug, access_group_slug:, namespace:, request_options: {})
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
        # @see Scalar::Models::Schemas::AccessGroupDeleteParams
        def delete(slug, params)
          parsed, options = Scalar::Schemas::AccessGroupDeleteParams.dump_request(params)
          namespace =
            parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
          @client.request(
            method: :delete,
            path: ["v1/schemas/%1$s/%2$s/access-group", namespace, slug],
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
end
