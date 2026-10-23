# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#list
    class PlanetListResponse < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<Object>, nil]
      optional :data, ScalarGalaxy::Internal::Type::ArrayOf[ScalarGalaxy::Internal::Type::Unknown]

      # @!attribute meta
      #
      #   @return [ScalarGalaxy::Models::PlanetListResponse::Meta, nil]
      optional :meta, -> { ScalarGalaxy::Models::PlanetListResponse::Meta }

      # @!method initialize(data: nil, meta: nil)
      #   @param data [Array<Object>]
      #   @param meta [ScalarGalaxy::Models::PlanetListResponse::Meta]

      # @see ScalarGalaxy::Models::PlanetListResponse#meta
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
