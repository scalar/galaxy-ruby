# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::CelestialBodies#create
    class CelestialBodyCreateParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute celestial_body
      #
      #   @return [ScalarGalaxy::Models::Planet, ScalarGalaxy::Models::CelestialBody::Satellite]
      required :celestial_body, union: -> { ScalarGalaxy::CelestialBody }

      # @!method initialize(celestial_body:, request_options: {})
      #   @param celestial_body [ScalarGalaxy::Models::Planet, ScalarGalaxy::Models::CelestialBody::Satellite]
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
