# frozen_string_literal: true

module Scalar
  module Resources
    # Teams
    class Teams
      # List all available teams
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::TeamListResponseItem>]
      #
      # @see Scalar::Models::TeamListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/teams",
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::TeamListResponseItem],
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
