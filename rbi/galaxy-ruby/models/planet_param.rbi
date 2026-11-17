# typed: strong

module ScalarGalaxy
  module Models
    class PlanetParam < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ScalarGalaxy::PlanetParam, ScalarGalaxy::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      # Atmospheric composition
      sig do
        returns(T.nilable(T::Array[ScalarGalaxy::PlanetParam::Atmosphere]))
      end
      attr_reader :atmosphere

      sig do
        params(atmosphere: T::Array[ScalarGalaxy::PlanetParam::Atmosphere]).void
      end
      attr_writer :atmosphere

      # A user
      sig { returns(T.nilable(ScalarGalaxy::UserParam)) }
      attr_reader :creator

      sig { params(creator: ScalarGalaxy::UserParam).void }
      attr_writer :creator

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(Time)) }
      attr_reader :discovered_at

      sig { params(discovered_at: Time).void }
      attr_writer :discovered_at

      # URL which gets invoked upon a failed operation
      sig { returns(T.nilable(String)) }
      attr_reader :failure_callback_url

      sig { params(failure_callback_url: String).void }
      attr_writer :failure_callback_url

      # A score from 0 to 1 indicating potential habitability
      sig { returns(T.nilable(Float)) }
      attr_reader :habitability_index

      sig { params(habitability_index: Float).void }
      attr_writer :habitability_index

      sig { returns(T.nilable(String)) }
      attr_accessor :image

      sig { returns(T.nilable(ScalarGalaxy::PlanetParam::PhysicalProperties)) }
      attr_reader :physical_properties

      sig do
        params(
          physical_properties: ScalarGalaxy::PlanetParam::PhysicalProperties
        ).void
      end
      attr_writer :physical_properties

      sig { returns(T.nilable(T::Array[T.anything])) }
      attr_reader :satellites

      sig { params(satellites: T::Array[T.anything]).void }
      attr_writer :satellites

      # URL which gets invoked upon a successful operation
      sig { returns(T.nilable(String)) }
      attr_reader :success_callback_url

      sig { params(success_callback_url: String).void }
      attr_writer :success_callback_url

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      sig { returns(T.nilable(ScalarGalaxy::PlanetParam::Type::OrSymbol)) }
      attr_reader :type

      sig { params(type: ScalarGalaxy::PlanetParam::Type::OrSymbol).void }
      attr_writer :type

      # A planet in the Scalar Galaxy
      sig do
        params(
          name: String,
          atmosphere: T::Array[ScalarGalaxy::PlanetParam::Atmosphere],
          creator: ScalarGalaxy::UserParam,
          description: T.nilable(String),
          discovered_at: Time,
          failure_callback_url: String,
          habitability_index: Float,
          image: T.nilable(String),
          physical_properties: ScalarGalaxy::PlanetParam::PhysicalProperties,
          satellites: T::Array[T.anything],
          success_callback_url: String,
          tags: T::Array[String],
          type: ScalarGalaxy::PlanetParam::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # Atmospheric composition
        atmosphere: nil,
        # A user
        creator: nil,
        description: nil,
        discovered_at: nil,
        # URL which gets invoked upon a failed operation
        failure_callback_url: nil,
        # A score from 0 to 1 indicating potential habitability
        habitability_index: nil,
        image: nil,
        physical_properties: nil,
        satellites: nil,
        # URL which gets invoked upon a successful operation
        success_callback_url: nil,
        tags: nil,
        type: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            atmosphere: T::Array[ScalarGalaxy::PlanetParam::Atmosphere],
            creator: ScalarGalaxy::UserParam,
            description: T.nilable(String),
            discovered_at: Time,
            failure_callback_url: String,
            habitability_index: Float,
            image: T.nilable(String),
            physical_properties: ScalarGalaxy::PlanetParam::PhysicalProperties,
            satellites: T::Array[T.anything],
            success_callback_url: String,
            tags: T::Array[String],
            type: ScalarGalaxy::PlanetParam::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Atmosphere < ScalarGalaxy::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ScalarGalaxy::PlanetParam::Atmosphere,
              ScalarGalaxy::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :compound

        sig { params(compound: String).void }
        attr_writer :compound

        sig { returns(T.nilable(Float)) }
        attr_reader :percentage

        sig { params(percentage: Float).void }
        attr_writer :percentage

        sig do
          params(compound: String, percentage: Float).returns(T.attached_class)
        end
        def self.new(compound: nil, percentage: nil)
        end

        sig { override.returns({ compound: String, percentage: Float }) }
        def to_hash
        end
      end

      class PhysicalProperties < ScalarGalaxy::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ScalarGalaxy::PlanetParam::PhysicalProperties,
              ScalarGalaxy::Internal::AnyHash
            )
          end

        # Surface gravity in Earth g
        sig { returns(T.nilable(Float)) }
        attr_reader :gravity

        sig { params(gravity: Float).void }
        attr_writer :gravity

        # Mass in Earth masses (must be greater than 0)
        sig { returns(T.nilable(Float)) }
        attr_reader :mass

        sig { params(mass: Float).void }
        attr_writer :mass

        # Radius in Earth radii (must be greater than 0)
        sig { returns(T.nilable(Float)) }
        attr_reader :radius

        sig { params(radius: Float).void }
        attr_writer :radius

        sig do
          returns(
            T.nilable(
              ScalarGalaxy::PlanetParam::PhysicalProperties::Temperature
            )
          )
        end
        attr_reader :temperature

        sig do
          params(
            temperature:
              ScalarGalaxy::PlanetParam::PhysicalProperties::Temperature
          ).void
        end
        attr_writer :temperature

        sig do
          params(
            gravity: Float,
            mass: Float,
            radius: Float,
            temperature:
              ScalarGalaxy::PlanetParam::PhysicalProperties::Temperature
          ).returns(T.attached_class)
        end
        def self.new(
          # Surface gravity in Earth g
          gravity: nil,
          # Mass in Earth masses (must be greater than 0)
          mass: nil,
          # Radius in Earth radii (must be greater than 0)
          radius: nil,
          temperature: nil
        )
        end

        sig do
          override.returns(
            {
              gravity: Float,
              mass: Float,
              radius: Float,
              temperature:
                ScalarGalaxy::PlanetParam::PhysicalProperties::Temperature
            }
          )
        end
        def to_hash
        end

        class Temperature < ScalarGalaxy::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ScalarGalaxy::PlanetParam::PhysicalProperties::Temperature,
                ScalarGalaxy::Internal::AnyHash
              )
            end

          # Average temperature in Kelvin
          sig { returns(T.nilable(Float)) }
          attr_reader :average

          sig { params(average: Float).void }
          attr_writer :average

          # Maximum temperature in Kelvin
          sig { returns(T.nilable(Float)) }
          attr_reader :max

          sig { params(max: Float).void }
          attr_writer :max

          # Minimum temperature in Kelvin
          sig { returns(T.nilable(Float)) }
          attr_reader :min

          sig { params(min: Float).void }
          attr_writer :min

          sig do
            params(average: Float, max: Float, min: Float).returns(
              T.attached_class
            )
          end
          def self.new(
            # Average temperature in Kelvin
            average: nil,
            # Maximum temperature in Kelvin
            max: nil,
            # Minimum temperature in Kelvin
            min: nil
          )
          end

          sig { override.returns({ average: Float, max: Float, min: Float }) }
          def to_hash
          end
        end
      end

      module Type
        extend ScalarGalaxy::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ScalarGalaxy::PlanetParam::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TERRESTRIAL =
          T.let(:terrestrial, ScalarGalaxy::PlanetParam::Type::TaggedSymbol)
        GAS_GIANT =
          T.let(:gas_giant, ScalarGalaxy::PlanetParam::Type::TaggedSymbol)
        ICE_GIANT =
          T.let(:ice_giant, ScalarGalaxy::PlanetParam::Type::TaggedSymbol)
        DWARF = T.let(:dwarf, ScalarGalaxy::PlanetParam::Type::TaggedSymbol)
        SUPER_EARTH =
          T.let(:super_earth, ScalarGalaxy::PlanetParam::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ScalarGalaxy::PlanetParam::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
