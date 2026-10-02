# typed: strong

module ScalarGalaxy
  module Models
    class PlanetListAllDataResponse < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::Models::PlanetListAllDataResponse,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[T.anything])) }
      attr_reader :data

      sig { params(data: T::Array[T.anything]).void }
      attr_writer :data

      sig do
        returns(
          T.nilable(ScalarGalaxy::Models::PlanetListAllDataResponse::Meta)
        )
      end
      attr_reader :meta

      sig do
        params(
          meta: ScalarGalaxy::Models::PlanetListAllDataResponse::Meta::OrHash
        ).void
      end
      attr_writer :meta

      sig do
        params(
          data: T::Array[T.anything],
          meta: ScalarGalaxy::Models::PlanetListAllDataResponse::Meta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(data: nil, meta: nil)
      end

      sig do
        override.returns(
          {
            data: T::Array[T.anything],
            meta: ScalarGalaxy::Models::PlanetListAllDataResponse::Meta
          }
        )
      end
      def to_hash
      end

      class Meta < ScalarGalaxy::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ScalarGalaxy::Models::PlanetListAllDataResponse::Meta,
              ScalarGalaxy::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig { returns(T.nilable(String)) }
        attr_accessor :next_

        sig { returns(T.nilable(Integer)) }
        attr_reader :offset

        sig { params(offset: Integer).void }
        attr_writer :offset

        sig { returns(T.nilable(Integer)) }
        attr_reader :total

        sig { params(total: Integer).void }
        attr_writer :total

        sig do
          params(
            limit: Integer,
            next_: T.nilable(String),
            offset: Integer,
            total: Integer
          ).returns(T.attached_class)
        end
        def self.new(limit: nil, next_: nil, offset: nil, total: nil)
        end

        sig do
          override.returns(
            {
              limit: Integer,
              next_: T.nilable(String),
              offset: Integer,
              total: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
