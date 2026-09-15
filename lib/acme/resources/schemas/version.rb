# frozen_string_literal: true

module Scalar
  module Resources
    class Schemas
      # Schemas
      class Version
        # Create a schema version.
        #
        # @overload create(slug, namespace:, document:, version:, request_options: {})
        #
        # @param slug [String] Path param
        #
        # @param namespace [String] Path param
        #
        # @param document [String] Body param
        #
        # @param version [String] Body param
        #
        # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Scalar::Models::UID]
        #
        # @see Scalar::Models::Schemas::VersionCreateParams
        def create(slug, params)
          parsed, options = Scalar::Schemas::VersionCreateParams.dump_request(params)
          namespace =
            parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
          @client.request(
            method: :post,
            path: ["v1/schemas/%1$s/%2$s/version", namespace, slug],
            body: parsed,
            model: Scalar::UID,
            options: options
          )
        end

        # Get a specific schema version document.
        #
        # @overload retrieve(semver, namespace:, slug:, request_options: {})
        #
        # @param semver [String]
        # @param namespace [String]
        # @param slug [String]
        # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [String]
        #
        # @see Scalar::Models::Schemas::VersionRetrieveParams
        def retrieve(semver, params)
          parsed, options = Scalar::Schemas::VersionRetrieveParams.dump_request(params)
          namespace =
            parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
          slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
          @client.request(
            method: :get,
            path: ["v1/schemas/%1$s/%2$s/version/%3$s", namespace, slug, semver],
            headers: {
              "accept" => "text/plain"
            },
            model: String,
            options: options
          )
        end

        # Delete a schema version.
        #
        # @overload delete(semver, namespace:, slug:, request_options: {})
        #
        # @param semver [String]
        # @param namespace [String]
        # @param slug [String]
        # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Object]
        #
        # @see Scalar::Models::Schemas::VersionDeleteParams
        def delete(semver, params)
          parsed, options = Scalar::Schemas::VersionDeleteParams.dump_request(params)
          namespace =
            parsed.delete(:namespace) { raise ArgumentError.new("missing required path argument #{_1}") }
          slug = parsed.delete(:slug) { raise ArgumentError.new("missing required path argument #{_1}") }
          @client.request(
            method: :delete,
            path: ["v1/schemas/%1$s/%2$s/version/%3$s", namespace, slug, semver],
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
