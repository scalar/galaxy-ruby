# typed: strong

module ScalarGalaxy
  module Models
    class PlanetUpdateParams < ScalarGalaxy::Models::Planet
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::PlanetUpdateParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :planet_id

      # A user
      sig { returns(T.nilable(ScalarGalaxy::UserParam)) }
      attr_reader :creator

      sig { params(creator: ScalarGalaxy::UserParam).void }
      attr_writer :creator

      sig do
        params(
          planet_id: Integer,
          creator: ScalarGalaxy::UserParam,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        planet_id:,
        # A user
        creator: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            planet_id: Integer,
            creator: ScalarGalaxy::UserParam,
            request_options: ScalarGalaxy::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
