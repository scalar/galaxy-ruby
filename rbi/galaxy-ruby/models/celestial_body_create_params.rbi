# typed: strong

module ScalarGalaxy
  module Models
    class CelestialBodyCreateParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::CelestialBodyCreateParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(ScalarGalaxy::Planet, ScalarGalaxy::CelestialBody::Satellite)
        )
      end
      attr_accessor :celestial_body

      sig do
        params(
          celestial_body:
            T.any(
              ScalarGalaxy::Planet::OrHash,
              ScalarGalaxy::CelestialBody::Satellite::OrHash
            ),
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(celestial_body:, request_options: {})
      end

      sig do
        override.returns(
          {
            celestial_body:
              T.any(
                ScalarGalaxy::Planet,
                ScalarGalaxy::CelestialBody::Satellite
              ),
            request_options: ScalarGalaxy::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
