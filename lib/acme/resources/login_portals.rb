# frozen_string_literal: true

module Scalar
  module Resources
    # Login Portals
    class LoginPortals
      # Create a login portal for the current team.
      #
      # @overload create(email:, page:, slug:, title:, request_options: {})
      #
      # @param email [Scalar::Models::LoginPortalEmail]
      # @param page [Scalar::Models::LoginPortalPage]
      # @param slug [String]
      # @param title [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::UID]
      #
      # @see Scalar::Models::LoginPortalCreateParams
      def create(params)
        parsed, options = Scalar::LoginPortalCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/login-portals",
          body: parsed,
          model: Scalar::UID,
          options: options
        )
      end

      # Get a login portal by slug.
      #
      # @overload retrieve(slug, request_options: {})
      #
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Scalar::Models::LoginPortalRetrieveResponse]
      #
      # @see Scalar::Models::LoginPortalRetrieveParams
      def retrieve(slug, params = {})
        @client.request(
          method: :get,
          path: ["v1/login-portals/%1$s", slug],
          model: Scalar::Models::LoginPortalRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update metadata for a login portal.
      #
      # @overload update(slug, title: nil, request_options: {})
      #
      # @param slug [String]
      # @param title [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::LoginPortalUpdateParams
      def update(slug, params = {})
        parsed, options = Scalar::LoginPortalUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/login-portals/%1$s", slug],
          body: parsed,
          model: Scalar::Internal::Type::Unknown,
          options: options
        )
      end

      # List all login portals for the current team.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Scalar::Models::LoginPortalListResponseItem>]
      #
      # @see Scalar::Models::LoginPortalListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/login-portals",
          model: Scalar::Internal::Type::ArrayOf[Scalar::Models::LoginPortalListResponseItem],
          options: params[:request_options]
        )
      end

      # Delete a login portal.
      #
      # @overload delete(slug, request_options: {})
      #
      # @param slug [String]
      # @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Scalar::Models::LoginPortalDeleteParams
      def delete(slug, params = {})
        @client.request(
          method: :delete,
          path: ["v1/login-portals/%1$s", slug],
          model: Scalar::Internal::Type::Unknown,
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
