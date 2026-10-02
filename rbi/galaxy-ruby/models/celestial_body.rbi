# typed: strong

module ScalarGalaxy
  module Models
    # A celestial body which can be either a planet or a satellite
    module CelestialBody
      extend ScalarGalaxy::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(ScalarGalaxy::Planet, ScalarGalaxy::CelestialBody::Satellite)
        end

      class Satellite < ScalarGalaxy::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ScalarGalaxy::CelestialBody::Satellite,
              ScalarGalaxy::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Diameter in kilometers
        sig { returns(T.nilable(Float)) }
        attr_reader :diameter

        sig { params(diameter: Float).void }
        attr_writer :diameter

        sig { returns(T.nilable(T.anything)) }
        attr_reader :orbit

        sig { params(orbit: T.anything).void }
        attr_writer :orbit

        sig do
          returns(
            T.nilable(ScalarGalaxy::CelestialBody::Satellite::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: ScalarGalaxy::CelestialBody::Satellite::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            name: String,
            id: Integer,
            description: T.nilable(String),
            diameter: Float,
            orbit: T.anything,
            type: ScalarGalaxy::CelestialBody::Satellite::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          name:,
          id: nil,
          description: nil,
          # Diameter in kilometers
          diameter: nil,
          orbit: nil,
          type: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              id: Integer,
              description: T.nilable(String),
              diameter: Float,
              orbit: T.anything,
              type: ScalarGalaxy::CelestialBody::Satellite::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend ScalarGalaxy::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ScalarGalaxy::CelestialBody::Satellite::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MOON =
            T.let(
              :moon,
              ScalarGalaxy::CelestialBody::Satellite::Type::TaggedSymbol
            )
          ASTEROID =
            T.let(
              :asteroid,
              ScalarGalaxy::CelestialBody::Satellite::Type::TaggedSymbol
            )
          COMET =
            T.let(
              :comet,
              ScalarGalaxy::CelestialBody::Satellite::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ScalarGalaxy::CelestialBody::Satellite::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[ScalarGalaxy::CelestialBody::Variants]) }
      def self.variants
      end
    end
  end
end
