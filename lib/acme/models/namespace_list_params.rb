# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Namespaces#list
    class NamespaceListParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
