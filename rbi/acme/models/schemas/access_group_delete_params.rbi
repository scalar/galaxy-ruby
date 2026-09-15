# typed: strong

module Scalar
  module Models
    module Schemas
      class AccessGroupDeleteParams < Scalar::Models::AccessGroup
        extend Scalar::Internal::Type::RequestParameters::Converter
        include Scalar::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Scalar::Schemas::AccessGroupDeleteParams,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :namespace

        sig { returns(String) }
        attr_accessor :slug

        sig do
          params(
            namespace: String,
            slug: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(namespace:, slug:, request_options: {})
        end

        sig do
          override.returns(
            {
              namespace: String,
              slug: String,
              request_options: Scalar::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
