# typed: strong

module Scalar
  module Models
    module Schemas
      class VersionCreateParams < Scalar::Internal::Type::BaseModel
        extend Scalar::Internal::Type::RequestParameters::Converter
        include Scalar::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Scalar::Schemas::VersionCreateParams,
              Scalar::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :namespace

        sig { returns(String) }
        attr_accessor :slug

        sig { returns(String) }
        attr_accessor :document

        sig { returns(String) }
        attr_accessor :version

        sig do
          params(
            namespace: String,
            slug: String,
            document: String,
            version: String,
            request_options: Scalar::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          namespace:,
          slug:,
          document:,
          version:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              namespace: String,
              slug: String,
              document: String,
              version: String,
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
