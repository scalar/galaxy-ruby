# typed: strong

module ScalarGalaxy
  module Models
    class PlanetListAllDataParams < ScalarGalaxy::Internal::Type::BaseModel
      extend ScalarGalaxy::Internal::Type::RequestParameters::Converter
      include ScalarGalaxy::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::PlanetListAllDataParams,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      # The number of items to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # The number of items to skip before starting to collect the result set
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      sig do
        params(
          limit: Integer,
          offset: Integer,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of items to return
        limit: nil,
        # The number of items to skip before starting to collect the result set
        offset: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            limit: Integer,
            offset: Integer,
            request_options: ScalarGalaxy::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
