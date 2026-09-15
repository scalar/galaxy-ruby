# frozen_string_literal: true

module Scalar
  module Resources
    # Scalar Docs
    class ScalarDocs
      # Create a guide project.
      #
      # @overload create_guide(allowed_domains:, allowed_users:, is_private:, name:, slug: nil, request_options: {})
      #
      # @param allowed_domains [Array<String>]
      # @param allowed_users [Array<String>]
      # @param is_private [Boolean]
      # @param name [String]
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::ScalarDocCreateGuideResponse]
      #
      # @see Scalar::Models::ScalarDocCreateGuideParams
      def create_guide(params)
        parsed, options = Scalar::ScalarDocCreateGuideParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/guides",
          body: parsed,
          model: Scalar::Models::ScalarDocCreateGuideResponse,
          options: options
        )
      end

      # List all guide projects.
      #
      # @overload list_guides(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::ScalarDocListGuidesResponseItem>]
      #
      # @see Scalar::Models::ScalarDocListGuidesParams
      def list_guides(params = {})
        @client.request(
          method: :get,
          path: "v1/guides",
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::ScalarDocListGuidesResponseItem],
          options: params[:request_options]
        )
      end

      # Start a new publish process.
      #
      # @overload publish_guide(slug, request_options: {})
      #
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::ScalarDocPublishGuideResponse]
      #
      # @see Scalar::Models::ScalarDocPublishGuideParams
      def publish_guide(slug, params = {})
        @client.request(
          method: :post,
          path: ["v1/guides/%1$s/publish", slug],
          model: Scalar::Models::ScalarDocPublishGuideResponse,
          options: params[:request_options]
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
