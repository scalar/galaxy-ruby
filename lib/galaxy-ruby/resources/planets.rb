# frozen_string_literal: true

module ScalarGalaxy
  module Resources
    # Everything about planets
    class Planets
      # Time to play god and create a new planet. What do you think? Ah, don't think too
      # much. What could go wrong anyway?
      #
      # @overload create(id:, name:, atmosphere: nil, creator: nil, description: nil, discovered_at: nil, failure_callback_url: nil, habitability_index: nil, image: nil, last_updated: nil, physical_properties: nil, satellites: nil, success_callback_url: nil, tags: nil, type: nil, request_options: {})
      #
      # @param id [Integer]
      #
      # @param name [String]
      #
      # @param atmosphere [Array<ScalarGalaxy::Models::Planet::Atmosphere>] Atmospheric composition
      #
      # @param creator [ScalarGalaxy::Models::User] A user
      #
      # @param description [String, nil]
      #
      # @param discovered_at [Time]
      #
      # @param failure_callback_url [String] URL which gets invoked upon a failed operation
      #
      # @param habitability_index [Float] A score from 0 to 1 indicating potential habitability
      #
      # @param image [String, nil]
      #
      # @param last_updated [Time]
      #
      # @param physical_properties [ScalarGalaxy::Models::Planet::PhysicalProperties]
      #
      # @param satellites [Array<Object>]
      #
      # @param success_callback_url [String] URL which gets invoked upon a successful operation
      #
      # @param tags [Array<String>]
      #
      # @param type [Symbol, ScalarGalaxy::Models::Planet::Type]
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::Planet]
      #
      # @see ScalarGalaxy::Models::PlanetCreateParams
      def create(params)
        parsed, options = ScalarGalaxy::PlanetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "planets",
          body: parsed,
          model: ScalarGalaxy::Planet,
          options: options
        )
      end

      # You'll better learn a little bit more about the planets. It might come in handy
      # once space travel is available for everyone.
      #
      # @overload retrieve(planet_id, request_options: {})
      #
      # @param planet_id [Integer] The ID of the planet to get
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::Planet]
      #
      # @see ScalarGalaxy::Models::PlanetRetrieveParams
      def retrieve(planet_id, params = {})
        @client.request(
          method: :get,
          path: ["planets/%1$s", planet_id],
          model: ScalarGalaxy::Planet,
          options: params[:request_options]
        )
      end

      # Sometimes you make mistakes, that's fine. No worries, you can update all
      # planets.
      #
      # @overload update(planet_id, id:, name:, atmosphere: nil, creator: nil, description: nil, discovered_at: nil, failure_callback_url: nil, habitability_index: nil, image: nil, last_updated: nil, physical_properties: nil, satellites: nil, success_callback_url: nil, tags: nil, type: nil, request_options: {})
      #
      # @param planet_id [Integer] The ID of the planet to get
      #
      # @param id [Integer]
      #
      # @param name [String]
      #
      # @param atmosphere [Array<ScalarGalaxy::Models::Planet::Atmosphere>] Atmospheric composition
      #
      # @param creator [ScalarGalaxy::Models::User] A user
      #
      # @param description [String, nil]
      #
      # @param discovered_at [Time]
      #
      # @param failure_callback_url [String] URL which gets invoked upon a failed operation
      #
      # @param habitability_index [Float] A score from 0 to 1 indicating potential habitability
      #
      # @param image [String, nil]
      #
      # @param last_updated [Time]
      #
      # @param physical_properties [ScalarGalaxy::Models::Planet::PhysicalProperties]
      #
      # @param satellites [Array<Object>]
      #
      # @param success_callback_url [String] URL which gets invoked upon a successful operation
      #
      # @param tags [Array<String>]
      #
      # @param type [Symbol, ScalarGalaxy::Models::Planet::Type]
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::Planet]
      #
      # @see ScalarGalaxy::Models::PlanetUpdateParams
      def update(planet_id, params)
        parsed, options = ScalarGalaxy::PlanetUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["planets/%1$s", planet_id],
          body: parsed,
          model: ScalarGalaxy::Planet,
          options: options
        )
      end

      # This endpoint was used to delete planets. Unfortunately, that caused a lot of
      # trouble for planets with life. So, this endpoint is now deprecated and should
      # not be used anymore.
      #
      # @overload delete(planet_id, request_options: {})
      #
      # @param planet_id [Integer] The ID of the planet to get
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see ScalarGalaxy::Models::PlanetDeleteParams
      def delete(planet_id, params = {})
        @client.request(
          method: :delete,
          path: ["planets/%1$s", planet_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Got a crazy good photo of a planet? Share it with the world!
      #
      # @overload delte_image(planet_id, image: nil, request_options: {})
      #
      # @param planet_id [Integer] The ID of the planet to get
      #
      # @param image [Pathname, StringIO, IO, String, ScalarGalaxy::FilePart] The image file to upload
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::PlanetDelteImageResponse]
      #
      # @see ScalarGalaxy::Models::PlanetDelteImageParams
      def delte_image(planet_id, params = {})
        parsed, options = ScalarGalaxy::PlanetDelteImageParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["planets/%1$s/image", planet_id],
          headers: {
            "content-type" => "multipart/form-data"
          },
          body: parsed,
          model: ScalarGalaxy::Models::PlanetDelteImageResponse,
          options: options
        )
      end

      # It's easy to say you know them all, but do you really? Retrieve all the planets
      # and check whether you missed one.
      #
      # @overload list_all_data(limit: nil, offset: nil, request_options: {})
      #
      # @param limit [Integer] The number of items to return
      #
      # @param offset [Integer] The number of items to skip before starting to collect the result set
      #
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::PlanetListAllDataResponse]
      #
      # @see ScalarGalaxy::Models::PlanetListAllDataParams
      def list_all_data(params = {})
        parsed, options = ScalarGalaxy::PlanetListAllDataParams.dump_request(params)
        query = ScalarGalaxy::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "planets",
          query: query,
          model: ScalarGalaxy::Models::PlanetListAllDataResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ScalarGalaxy::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
