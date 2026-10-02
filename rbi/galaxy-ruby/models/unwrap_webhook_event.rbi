# typed: strong

module ScalarGalaxy
  module Models
    module UnwrapWebhookEvent
      extend ScalarGalaxy::Internal::Type::Union

      Variants = T.type_alias { T.any(ScalarGalaxy::NewPlanetWebhookEvent) }

      sig do
        override.returns(T::Array[ScalarGalaxy::UnwrapWebhookEvent::Variants])
      end
      def self.variants
      end
    end
  end
end
