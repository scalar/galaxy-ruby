# frozen_string_literal: true

module ScalarGalaxy
  module Models
    class NewPlanetWebhookEvent < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute atmosphere
      #   Atmospheric composition
      #
      #   @return [Array<ScalarGalaxy::Models::NewPlanetWebhookEvent::Atmosphere>, nil]
      optional :atmosphere,
               -> { ScalarGalaxy::Internal::Type::ArrayOf[ScalarGalaxy::NewPlanetWebhookEvent::Atmosphere] }

      # @!attribute creator
      #   A user
      #
      #   @return [ScalarGalaxy::Models::User, nil]
      optional :creator, -> { ScalarGalaxy::User }

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute discovered_at
      #
      #   @return [Time, nil]
      optional :discovered_at, Time, api_name: :discoveredAt

      # @!attribute failure_callback_url
      #   URL which gets invoked upon a failed operation
      #
      #   @return [String, nil]
      optional :failure_callback_url, String, api_name: :failureCallbackUrl

      # @!attribute habitability_index
      #   A score from 0 to 1 indicating potential habitability
      #
      #   @return [Float, nil]
      optional :habitability_index, Float, api_name: :habitabilityIndex

      # @!attribute image
      #
      #   @return [String, nil]
      optional :image, String, nil?: true

      # @!attribute physical_properties
      #
      #   @return [ScalarGalaxy::Models::NewPlanetWebhookEvent::PhysicalProperties, nil]
      optional :physical_properties,
               -> { ScalarGalaxy::NewPlanetWebhookEvent::PhysicalProperties },
               api_name: :physicalProperties

      # @!attribute satellites
      #
      #   @return [Array<Object>, nil]
      optional :satellites, ScalarGalaxy::Internal::Type::ArrayOf[ScalarGalaxy::Internal::Type::Unknown]

      # @!attribute success_callback_url
      #   URL which gets invoked upon a successful operation
      #
      #   @return [String, nil]
      optional :success_callback_url, String, api_name: :successCallbackUrl

      # @!attribute tags
      #
      #   @return [Array<String>, nil]
      optional :tags, ScalarGalaxy::Internal::Type::ArrayOf[String]

      # @!attribute type
      #
      #   @return [Symbol, ScalarGalaxy::Models::NewPlanetWebhookEvent::Type, nil]
      optional :type, enum: -> { ScalarGalaxy::NewPlanetWebhookEvent::Type }

      response_only do
        # @!attribute id
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute last_updated
        #
        #   @return [Time, nil]
        optional :last_updated, Time, api_name: :lastUpdated
      end

      # @!method initialize(id:, name:, atmosphere: nil, creator: nil, description: nil, discovered_at: nil, failure_callback_url: nil, habitability_index: nil, image: nil, last_updated: nil, physical_properties: nil, satellites: nil, success_callback_url: nil, tags: nil, type: nil)
      #   @param id [Integer]
      #
      #   @param name [String]
      #
      #   @param atmosphere [Array<ScalarGalaxy::Models::NewPlanetWebhookEvent::Atmosphere>] Atmospheric composition
      #
      #   @param creator [ScalarGalaxy::Models::User] A user
      #
      #   @param description [String, nil]
      #
      #   @param discovered_at [Time]
      #
      #   @param failure_callback_url [String] URL which gets invoked upon a failed operation
      #
      #   @param habitability_index [Float] A score from 0 to 1 indicating potential habitability
      #
      #   @param image [String, nil]
      #
      #   @param last_updated [Time]
      #
      #   @param physical_properties [ScalarGalaxy::Models::NewPlanetWebhookEvent::PhysicalProperties]
      #
      #   @param satellites [Array<Object>]
      #
      #   @param success_callback_url [String] URL which gets invoked upon a successful operation
      #
      #   @param tags [Array<String>]
      #
      #   @param type [Symbol, ScalarGalaxy::Models::NewPlanetWebhookEvent::Type]

      class Atmosphere < ScalarGalaxy::Internal::Type::BaseModel
        # @!attribute compound
        #
        #   @return [String, nil]
        optional :compound, String

        # @!attribute percentage
        #
        #   @return [Float, nil]
        optional :percentage, Float

        # @!method initialize(compound: nil, percentage: nil)
        #   @param compound [String]
        #   @param percentage [Float]
      end

      # @see ScalarGalaxy::Models::NewPlanetWebhookEvent#physical_properties
      class PhysicalProperties < ScalarGalaxy::Internal::Type::BaseModel
        # @!attribute gravity
        #   Surface gravity in Earth g
        #
        #   @return [Float, nil]
        optional :gravity, Float

        # @!attribute mass
        #   Mass in Earth masses (must be greater than 0)
        #
        #   @return [Float, nil]
        optional :mass, Float

        # @!attribute radius
        #   Radius in Earth radii (must be greater than 0)
        #
        #   @return [Float, nil]
        optional :radius, Float

        # @!attribute temperature
        #
        #   @return [ScalarGalaxy::Models::NewPlanetWebhookEvent::PhysicalProperties::Temperature, nil]
        optional :temperature, -> { ScalarGalaxy::NewPlanetWebhookEvent::PhysicalProperties::Temperature }

        # @!method initialize(gravity: nil, mass: nil, radius: nil, temperature: nil)
        #   @param gravity [Float] Surface gravity in Earth g
        #
        #   @param mass [Float] Mass in Earth masses (must be greater than 0)
        #
        #   @param radius [Float] Radius in Earth radii (must be greater than 0)
        #
        #   @param temperature [ScalarGalaxy::Models::NewPlanetWebhookEvent::PhysicalProperties::Temperature]

        # @see ScalarGalaxy::Models::NewPlanetWebhookEvent::PhysicalProperties#temperature
        class Temperature < ScalarGalaxy::Internal::Type::BaseModel
          # @!attribute average
          #   Average temperature in Kelvin
          #
          #   @return [Float, nil]
          optional :average, Float

          # @!attribute max
          #   Maximum temperature in Kelvin
          #
          #   @return [Float, nil]
          optional :max, Float

          # @!attribute min
          #   Minimum temperature in Kelvin
          #
          #   @return [Float, nil]
          optional :min, Float

          # @!method initialize(average: nil, max: nil, min: nil)
          #   @param average [Float] Average temperature in Kelvin
          #
          #   @param max [Float] Maximum temperature in Kelvin
          #
          #   @param min [Float] Minimum temperature in Kelvin
        end
      end

      # @see ScalarGalaxy::Models::NewPlanetWebhookEvent#type
      module Type
        extend ScalarGalaxy::Internal::Type::Enum

        TERRESTRIAL = :terrestrial
        GAS_GIANT = :gas_giant
        ICE_GIANT = :ice_giant
        DWARF = :dwarf
        SUPER_EARTH = :super_earth

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
