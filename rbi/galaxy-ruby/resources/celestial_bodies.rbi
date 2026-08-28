# typed: strong

module ScalarGalaxy
  module Resources
    # Celestial bodies are the planets and satellites in the Scalar Galaxy.
    class CelestialBodies
      # Stars, moons, comets, the occasional rogue asteroid — if it glows or drifts
      # through the void, you can add it here.
      sig do
        params(
          celestial_body:
            T.any(
              ScalarGalaxy::Planet::OrHash,
              ScalarGalaxy::CelestialBody::Satellite::OrHash
            ),
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::CelestialBody::Variants)
      end
      def create(celestial_body:, request_options: {})
      end

      # @api private
      sig { params(client: ScalarGalaxy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
