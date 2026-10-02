# typed: strong

module ScalarGalaxy
  module Models
    class PlanetDelteImageResponse < ScalarGalaxy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ScalarGalaxy::Models::PlanetDelteImageResponse,
            ScalarGalaxy::Internal::AnyHash
          )
        end

      # Size of the uploaded image in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :file_size

      sig { params(file_size: Integer).void }
      attr_writer :file_size

      # The URL where the uploaded image can be accessed
      sig { returns(T.nilable(String)) }
      attr_reader :image_url

      sig { params(image_url: String).void }
      attr_writer :image_url

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # The content type of the uploaded image
      sig { returns(T.nilable(String)) }
      attr_reader :mime_type

      sig { params(mime_type: String).void }
      attr_writer :mime_type

      # Timestamp when the image was uploaded
      sig { returns(T.nilable(Time)) }
      attr_reader :uploaded_at

      sig { params(uploaded_at: Time).void }
      attr_writer :uploaded_at

      sig do
        params(
          file_size: Integer,
          image_url: String,
          message: String,
          mime_type: String,
          uploaded_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Size of the uploaded image in bytes
        file_size: nil,
        # The URL where the uploaded image can be accessed
        image_url: nil,
        message: nil,
        # The content type of the uploaded image
        mime_type: nil,
        # Timestamp when the image was uploaded
        uploaded_at: nil
      )
      end

      sig do
        override.returns(
          {
            file_size: Integer,
            image_url: String,
            message: String,
            mime_type: String,
            uploaded_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
