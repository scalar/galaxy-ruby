# typed: strong

module ScalarGalaxy
  module Models
    class PlanetDeleteParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::PlanetDeleteParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :planet_id

      sig do
        params(
          planet_id: Integer,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(planet_id:, request_options: {})
      end

      sig do
        override.returns(
          { planet_id: Integer, request_options: ScalarGalaxy::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
