# frozen_string_literal: true

module Scalar
  module Resources
    # Namespaces
    class Namespaces
      # Get all namespaces for the current team
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Scalar::Models::NamespaceListParams
      def list(params = {})
        @client.request(method: :get, path: "v1/namespaces", model: String, options: params[:request_options])
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
