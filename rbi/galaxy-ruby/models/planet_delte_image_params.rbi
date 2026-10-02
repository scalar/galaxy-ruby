# typed: strong

module ScalarGalaxy
  module Models
    class PlanetDelteImageParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::PlanetDelteImageParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :planet_id

      # The image file to upload
      sig { returns(T.nilable(ScalarGalaxy::Internal::FileInput)) }
      attr_reader :image

      sig { params(image: ScalarGalaxy::Internal::FileInput).void }
      attr_writer :image

      sig do
        params(
          planet_id: Integer,
          image: ScalarGalaxy::Internal::FileInput,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        planet_id:,
        # The image file to upload
        image: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            planet_id: Integer,
            image: ScalarGalaxy::Internal::FileInput,
            request_options: ScalarGalaxy::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
