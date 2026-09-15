# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::Authentication#list_current_user
    class AuthenticationListCurrentUserParams < Scalar::Internal::Type::BaseModel
      extend Scalar::Internal::Type::RequestParameters::Converter
      include Scalar::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Scalar::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
