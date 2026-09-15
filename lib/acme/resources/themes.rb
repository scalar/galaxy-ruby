# frozen_string_literal: true

module Scalar
  module Resources
    # Themes
    class Themes
      # Create a team theme.
      #
      # @overload create(document:, name:, slug:, description: nil, request_options: {})
      #
      # @param document [String]
      # @param name [String]
      # @param slug [String]
      # @param description [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::UID]
      #
      # @see Scalar::Models::ThemeCreateParams
      def create(params)
        parsed, options = Scalar::ThemeCreateParams.dump_request(params)
        @client.request(method: :post, path: "v1/themes", body: parsed, model: Scalar::UID, options: options)
      end

      # Get the theme document by slug.
      #
      # @overload retrieve(slug, request_options: {})
      #
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Scalar::Models::ThemeRetrieveParams
      def retrieve(slug, params = {})
        @client.request(
          method: :get,
          path: ["v1/themes/%1$s", slug],
          headers: {
            "accept" => "text/plain"
          },
          model: String,
          options: params[:request_options]
        )
      end

      # Update theme metadata.
      #
      # @overload update(slug, description: nil, name: nil, request_options: {})
      #
      # @param slug [String]
      # @param description [String]
      # @param name [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::ThemeUpdateParams
      def update(slug, params = {})
        parsed, options = Scalar::ThemeUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/themes/%1$s", slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # List all team themes.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::ThemeListResponseItem>]
      #
      # @see Scalar::Models::ThemeListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/themes",
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::ThemeListResponseItem],
          options: params[:request_options]
        )
      end

      # Delete a theme by slug.
      #
      # @overload delete(slug, request_options: {})
      #
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::ThemeDeleteParams
      def delete(slug, params = {})
        @client.request(
          method: :delete,
          path: ["v1/themes/%1$s", slug],
          model: Scalar::Internal::Type::Unknown,
          options: params[:request_options]
        )
      end

      # Replace the theme document.
      #
      # @overload replace_document(slug, document:, request_options: {})
      #
      # @param slug [String]
      # @param document [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::ThemeReplaceDocumentParams
      def replace_document(slug, params)
        parsed, options = Scalar::ThemeReplaceDocumentParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["v1/themes/%1$s", slug],
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
