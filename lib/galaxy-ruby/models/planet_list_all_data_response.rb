# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#list_all_data
    class PlanetListAllDataResponse < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<Object>, nil]
      optional :data, ScalarGalaxy::Internal::Type::ArrayOf[ScalarGalaxy::Internal::Type::Unknown]

      # @!attribute meta
      #
      #   @return [ScalarGalaxy::Models::PlanetListAllDataResponse::Meta, nil]
      optional :meta, -> { ScalarGalaxy::Models::PlanetListAllDataResponse::Meta }

      # @!method initialize(data: nil, meta: nil)
      #   @param data [Array<Object>]
      #   @param meta [ScalarGalaxy::Models::PlanetListAllDataResponse::Meta]

      # @see ScalarGalaxy::Models::PlanetListAllDataResponse#meta
      class Meta < ScalarGalaxy::Internal::Type::BaseModel
        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute next_
        #
        #   @return [String, nil]
        optional :next_, String, api_name: :next, nil?: true

        # @!attribute offset
        #
        #   @return [Integer, nil]
        optional :offset, Integer

        # @!attribute total
        #
        #   @return [Integer, nil]
        optional :total, Integer

        # @!method initialize(limit: nil, next_: nil, offset: nil, total: nil)
        #   @param limit [Integer]
        #   @param next_ [String, nil]
        #   @param offset [Integer]
        #   @param total [Integer]
      end
    end
  end
end
