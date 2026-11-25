# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # A celestial body which can be either a planet or a satellite
    module CelestialBodyParam
      extend ScalarGalaxy::Internal::Type::Union

      discriminator :type

      variant -> { ScalarGalaxy::PlanetParam }

      variant -> { ScalarGalaxy::CelestialBodyParam::Satellite }

      class Satellite < ScalarGalaxy::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute diameter
        #   Diameter in kilometers
        #
        #   @return [Float, nil]
        optional :diameter, Float

        # @!attribute orbit
        #
        #   @return [Object, nil]
        optional :orbit, ScalarGalaxy::Internal::Type::Unknown

        # @!attribute type
        #
        #   @return [Symbol, ScalarGalaxy::Models::CelestialBodyParam::Satellite::Type, nil]
        optional :type, enum: -> { ScalarGalaxy::CelestialBodyParam::Satellite::Type }

        drop_on_dump :id

        # @!method initialize(name:, description: nil, diameter: nil, orbit: nil, type: nil)
        #   @param name [String]
        #
        #   @param description [String, nil]
        #
        #   @param diameter [Float] Diameter in kilometers
        #
        #   @param orbit [Object]
        #
        #   @param type [Symbol, ScalarGalaxy::Models::CelestialBodyParam::Satellite::Type]

        # @see ScalarGalaxy::Models::CelestialBodyParam::Satellite#type
        module Type
          extend ScalarGalaxy::Internal::Type::Enum

          MOON = :moon
          ASTEROID = :asteroid
          COMET = :comet

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(ScalarGalaxy::Models::PlanetParam, ScalarGalaxy::Models::CelestialBodyParam::Satellite)]
    end
  end
end
