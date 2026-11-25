# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#create
    class PlanetCreateParams < ScalarGalaxy::Models::Planet
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute creator
      #   A user
      #
      #   @return [ScalarGalaxy::Models::UserParam, nil]
      optional :creator, -> { ScalarGalaxy::UserParam }

      drop_on_dump :lastUpdated

      # @!method initialize(creator: nil, request_options: {})
      #   @param creator [ScalarGalaxy::Models::UserParam] A user
      #
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
