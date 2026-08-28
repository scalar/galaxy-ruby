# frozen_string_literal: true

module ScalarGalaxy
  module Models
    # @see ScalarGalaxy::Resources::Planets#delte_image
    class PlanetDelteImageResponse < ScalarGalaxy::Internal::Type::BaseModel
      # @!attribute file_size
      #   Size of the uploaded image in bytes
      #
      #   @return [Integer, nil]
      optional :file_size, Integer, api_name: :fileSize

      # @!attribute image_url
      #   The URL where the uploaded image can be accessed
      #
      #   @return [String, nil]
      optional :image_url, String, api_name: :imageUrl

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute mime_type
      #   The content type of the uploaded image
      #
      #   @return [String, nil]
      optional :mime_type, String, api_name: :mimeType

      # @!attribute uploaded_at
      #   Timestamp when the image was uploaded
      #
      #   @return [Time, nil]
      optional :uploaded_at, Time, api_name: :uploadedAt

      # @!method initialize(file_size: nil, image_url: nil, message: nil, mime_type: nil, uploaded_at: nil)
      #   @param file_size [Integer] Size of the uploaded image in bytes
      #
      #   @param image_url [String] The URL where the uploaded image can be accessed
      #
      #   @param message [String]
      #
      #   @param mime_type [String] The content type of the uploaded image
      #
      #   @param uploaded_at [Time] Timestamp when the image was uploaded
    end
  end
end
