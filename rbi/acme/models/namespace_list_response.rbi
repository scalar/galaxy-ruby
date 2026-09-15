# typed: strong

module Scalar
  module Models
    NamespaceListResponseItem = String

    NamespaceListResponse =
      T.let(
        Scalar::Internal::Type::ArrayOf[
          Scalar::Models::NamespaceListResponseItem
        ],
        Scalar::Internal::Type::Converter
      )
  end
end
