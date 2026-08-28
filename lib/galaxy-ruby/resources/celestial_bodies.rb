# frozen_string_literal: true

module ScalarGalaxy
  module Resources
    # Celestial bodies are the planets and satellites in the Scalar Galaxy.
    class CelestialBodies
      # Stars, moons, comets, the occasional rogue asteroid — if it glows or drifts
      # through the void, you can add it here.
      #
      # @overload create(celestial_body:, request_options: {})
      #
      # @param celestial_body [ScalarGalaxy::Models::Planet, ScalarGalaxy::Models::CelestialBody::Satellite]
      # @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ScalarGalaxy::Models::Planet, ScalarGalaxy::Models::CelestialBody::Satellite]
      #
      # @see ScalarGalaxy::Models::CelestialBodyCreateParams
      def create(params)
        parsed, options = ScalarGalaxy::CelestialBodyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "celestial-bodies",
          body: parsed[:celestial_body],
          model: ScalarGalaxy::CelestialBody,
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
