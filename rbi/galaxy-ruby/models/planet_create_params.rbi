# typed: strong

module ScalarGalaxy
  module Models
    class PlanetCreateParams < ScalarGalaxy::Models::Planet
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::PlanetCreateParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      # A user
      sig { returns(T.nilable(ScalarGalaxy::UserParam)) }
      attr_reader :creator

      sig { params(creator: ScalarGalaxy::UserParam).void }
      attr_writer :creator

      sig do
        params(
          creator: ScalarGalaxy::UserParam,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A user
        creator: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
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
