# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::CelestialBodies#create
    class CelestialBodyCreateParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute celestial_body
      #
      #   @return [ScalarGalaxy::Models::PlanetParam, ScalarGalaxy::Models::CelestialBodyParam::Satellite]
      required :celestial_body, union: -> { ScalarGalaxy::CelestialBodyParam }

      # @!method initialize(celestial_body:, request_options: {})
      #   @param celestial_body [ScalarGalaxy::Models::PlanetParam, ScalarGalaxy::Models::CelestialBodyParam::Satellite]
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
