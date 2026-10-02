# frozen_string_literal: true

module ScalarGalaxy
  module Models
    module UnwrapWebhookEvent
      extend ScalarGalaxy::Internal::Type::Union

      variant -> { ScalarGalaxy::NewPlanetWebhookEvent }

      # @!method self.variants
      #   @return [Array(ScalarGalaxy::Models::NewPlanetWebhookEvent)]
    end
  end
end
