# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#list_all_data
    class PlanetListAllDataParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      # @!attribute limit
      #   The number of items to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute offset
      #   The number of items to skip before starting to collect the result set
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!method initialize(limit: nil, offset: nil, request_options: {})
      #   @param limit [Integer] The number of items to return
      #
      #   @param offset [Integer] The number of items to skip before starting to collect the result set
      #
      #   @param request_options [ScalarGalaxy::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
