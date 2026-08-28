# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#delte_image
    class PlanetDelteImageParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute planet_id
      #
      #   @return [Integer]
      required :planet_id, Integer

      # @!attribute image
      #   The image file to upload
      #
      #   @return [Pathname, StringIO, IO, String, ScalarGalaxy::FilePart, nil]
      optional :image, ScalarGalaxy::Internal::Type::FileInput

      # @!method initialize(planet_id:, image: nil, request_options: {})
      #   @param planet_id [Integer]
      #
      #   @param image [Pathname, StringIO, IO, String, ScalarGalaxy::FilePart] The image file to upload
      #
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
