# frozen_string_literal: true

module Scalar
  module Models
    NamespaceListResponseItem = String

    # @type [Scalar::Internal::Type::Converter]
    NamespaceListResponse = Scalar::Internal::Type::ArrayOf[-> { Scalar::Models::NamespaceListResponseItem }]
  end
end
