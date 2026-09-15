# frozen_string_literal: true

module Scalar
  module Models
    # @see Scalar::Resources::ScalarDocs#publish_guide
    class ScalarDocPublishGuideResponse < Scalar::Internal::Type::BaseModel
      # @!attribute publish_uid
      #
      #   @return [String]
      required :publish_uid, String, api_name: :publishUid

      # @!method initialize(publish_uid:)
      #   @param publish_uid [String]
    end
  end
end
