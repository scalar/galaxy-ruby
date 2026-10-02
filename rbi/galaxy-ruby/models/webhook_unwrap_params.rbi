# typed: strong

module ScalarGalaxy
  module Models
    class WebhookUnwrapParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::WebhookUnwrapParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig do
        params(request_options: ScalarGalaxy::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: ScalarGalaxy::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
