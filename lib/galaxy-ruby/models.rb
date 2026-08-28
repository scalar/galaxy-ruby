# frozen_string_literal: true

module ScalarGalaxy
  [ScalarGalaxy::Internal::Type::BaseModel, *ScalarGalaxy::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, ScalarGalaxy::Internal::AnyHash) } }
  end

  ScalarGalaxy::Internal::Util
    .walk_namespaces(ScalarGalaxy::Models)
    .each do |mod|
      case mod
      in ScalarGalaxy::Internal::Type::Enum | ScalarGalaxy::Internal::Type::Union
        mod.constants.each do |name|
          case mod.const_get(name)
          in true | false
            mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
            mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
          in Integer
            mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
            mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
          in Float
            mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
            mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
          in Symbol
            mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
            mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
          else
          end
        end
      else
      end
    end

  ScalarGalaxy::Internal::Util
    .walk_namespaces(ScalarGalaxy::Models)
    .lazy
    .grep(ScalarGalaxy::Internal::Type::Union)
    .each do |mod|
      const = :Variants
      next if mod.sorbet_constant_defined?(const)

      mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
    end

  AuthenticationCreateTokenParams = ScalarGalaxy::Models::AuthenticationCreateTokenParams

  AuthenticationCreateUserParams = ScalarGalaxy::Models::AuthenticationCreateUserParams

  AuthenticationListMeParams = ScalarGalaxy::Models::AuthenticationListMeParams

  CelestialBody = ScalarGalaxy::Models::CelestialBody

  CelestialBodyCreateParams = ScalarGalaxy::Models::CelestialBodyCreateParams

  Credentials = ScalarGalaxy::Models::Credentials

  NewPlanetWebhookEvent = ScalarGalaxy::Models::NewPlanetWebhookEvent

  Planet = ScalarGalaxy::Models::Planet

  PlanetCreateParams = ScalarGalaxy::Models::PlanetCreateParams

  PlanetDeleteParams = ScalarGalaxy::Models::PlanetDeleteParams

  PlanetDelteImageParams = ScalarGalaxy::Models::PlanetDelteImageParams

  PlanetListAllDataParams = ScalarGalaxy::Models::PlanetListAllDataParams

  PlanetRetrieveParams = ScalarGalaxy::Models::PlanetRetrieveParams

  PlanetUpdateParams = ScalarGalaxy::Models::PlanetUpdateParams

  UnwrapWebhookEvent = ScalarGalaxy::Models::UnwrapWebhookEvent

  User = ScalarGalaxy::Models::User

  WebhookUnwrapParams = ScalarGalaxy::Models::WebhookUnwrapParams
end
