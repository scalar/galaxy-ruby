# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # A celestial body which can be either a planet or a satellite
    #
    # @see ScalarGalaxy::Resources::CelestialBodies#create
    module CelestialBody
      extend ScalarGalaxy::Internal::Type::Union

      discriminator :type

      variant -> { ScalarGalaxy::Planet }

      variant -> { ScalarGalaxy::CelestialBody::Satellite }

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
        #   @return [Symbol, ScalarGalaxy::Models::CelestialBody::Satellite::Type, nil]
        optional :type, enum: -> { ScalarGalaxy::CelestialBody::Satellite::Type }

        response_only do
          # @!attribute id
          #
          #   @return [Integer, nil]
          optional :id, Integer
        end

        # @!method initialize(name:, id: nil, description: nil, diameter: nil, orbit: nil, type: nil)
        #   @param name [String]
        #
        #   @param id [Integer]
        #
        #   @param description [String, nil]
        #
        #   @param diameter [Float] Diameter in kilometers
        #
        #   @param orbit [Object]
        #
        #   @param type [Symbol, ScalarGalaxy::Models::CelestialBody::Satellite::Type]

        # @see ScalarGalaxy::Models::CelestialBody::Satellite#type
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
      #   @return [Array(ScalarGalaxy::Models::Planet, ScalarGalaxy::Models::CelestialBody::Satellite)]
    end
  end
end
