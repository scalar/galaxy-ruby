# frozen_string_literal: true

module Scalar
  module Resources
    # Schemas
    class Schemas
      # Schemas
      # @return [Scalar::Resources::Schemas::Version]
      attr_reader :version

      # Schemas
      # @return [Scalar::Resources::Schemas::AccessGroup]
      attr_reader :access_group

      # Create a schema in a namespace.
      #
      # @overload create(namespace, document:, slug:, title:, version:, description: nil, is_private: nil, request_options: {})
      #
      # @param namespace [String]
      # @param document [String]
      # @param slug [String]
      # @param title [String]
      # @param version [String]
      # @param description [String]
      # @param is_private [Boolean]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::UID]
      #
      # @see Scalar::Models::SchemaCreateParams
      def create(namespace, params)
        parsed, options = Scalar::SchemaCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/schemas/%1$s", namespace],
          body: parsed,
          model: Scalar::UID,
          options: options
        )
      end

      # Update schema metadata.
      #
      # @overload update(slug, namespace:, description: nil, is_private: nil, title: nil, request_options: {})
      #
      # @param slug [String] Path param
      #
      # @param namespace [String] Path param
      #
      # @param description [String] Body param
      #
      # @param is_private [Boolean] Body param
      #
      # @param title [String] Body param
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::SchemaUpdateParams
      def update(slug, params)
        parsed, options = Scalar::SchemaUpdateParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :patch,
          path: ["v1/schemas/%1$s/%2$s", namespace, slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # List schemas in a namespace.
      #
      # @overload list(namespace, request_options: {})
      #
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::SchemaListResponseItem>]
      #
      # @see Scalar::Models::SchemaListParams
      def list(namespace, params = {})
        @client.request(
          method: :get,
          path: ["v1/schemas/%1$s", namespace],
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::SchemaListResponseItem],
          options: params[:request_options]
        )
      end

      # Delete a schema and all related versions.
      #
      # @overload delete(slug, namespace:, request_options: {})
      #
      # @param slug [String]
      # @param namespace [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::SchemaDeleteParams
      def delete(slug, params)
        parsed, options = Scalar::SchemaDeleteParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
        @client.request(
          method: :delete,
          path: ["v1/schemas/%1$s/%2$s", namespace, slug],
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # @api private
      #
      # @param client [Scalar::Client]
      def initialize(client:)
        @client = client
        @version = Scalar::Resources::Schemas::Version.new(client: client)
        @access_group = Scalar::Resources::Schemas::AccessGroup.new(client: client)
      end
    end
  end
end
