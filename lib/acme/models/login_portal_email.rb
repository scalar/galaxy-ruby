# frozen_string_literal: true

module Scalar
  module Models
    class LoginPortalEmail < Scalar::Internal::Type::BaseModel
      # @!attribute button_background
      #
      #   @return [String]
      required :button_background, String, api_name: :buttonBackground

      # @!attribute button_color
      #
      #   @return [String]
      required :button_color, String, api_name: :buttonColor

      # @!attribute button_text
      #
      #   @return [String]
      required :button_text, String, api_name: :buttonText

      # @!attribute card_background
      #
      #   @return [String]
      required :card_background, String, api_name: :cardBackground

      # @!attribute card_color
      #
      #   @return [String]
      required :card_color, String, api_name: :cardColor

      # @!attribute logo
      #
      #   @return [String]
      required :logo, String

      # @!attribute logo_size
      #
      #   @return [String]
      required :logo_size, String, api_name: :logoSize

      # @!attribute main_background
      #
      #   @return [String]
      required :main_background, String, api_name: :mainBackground

      # @!attribute main_color
      #
      #   @return [String]
      required :main_color, String, api_name: :mainColor

      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!method initialize(button_background:, button_color:, button_text:, card_background:, card_color:, logo:, logo_size:, main_background:, main_color:, message:, title:)
      #   @param button_background [String]
      #   @param button_color [String]
      #   @param button_text [String]
      #   @param card_background [String]
      #   @param card_color [String]
      #   @param logo [String]
      #   @param logo_size [String]
      #   @param main_background [String]
      #   @param main_color [String]
      #   @param message [String]
      #   @param title [String]
    end
  end
end
