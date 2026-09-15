# frozen_string_literal: true

module Scalar
  module Models
    class LoginPortalPage < Scalar::Internal::Type::BaseModel
      # @!attribute company_name
      #
      #   @return [String]
      required :company_name, String, api_name: :companyName

      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute favicon
      #
      #   @return [String]
      required :favicon, String

      # @!attribute form_description
      #
      #   @return [String]
      required :form_description, String, api_name: :formDescription

      # @!attribute form_image
      #
      #   @return [String]
      required :form_image, String, api_name: :formImage

      # @!attribute form_title
      #
      #   @return [String]
      required :form_title, String, api_name: :formTitle

      # @!attribute head
      #
      #   @return [String]
      required :head, String

      # @!attribute logo
      #
      #   @return [String]
      required :logo, String

      # @!attribute logo_url
      #
      #   @return [String]
      required :logo_url, String, api_name: :logoURL

      # @!attribute privacy_link
      #
      #   @return [String]
      required :privacy_link, String, api_name: :privacyLink

      # @!attribute script
      #
      #   @return [String]
      required :script, String

      # @!attribute terms_link
      #
      #   @return [String]
      required :terms_link, String, api_name: :termsLink

      # @!attribute theme
      #
      #   @return [String]
      required :theme, String

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!method initialize(company_name:, description:, favicon:, form_description:, form_image:, form_title:, head:, logo:, logo_url:, privacy_link:, script:, terms_link:, theme:, title:)
      #   @param company_name [String]
      #   @param description [String]
      #   @param favicon [String]
      #   @param form_description [String]
      #   @param form_image [String]
      #   @param form_title [String]
      #   @param head [String]
      #   @param logo [String]
      #   @param logo_url [String]
      #   @param privacy_link [String]
      #   @param script [String]
      #   @param terms_link [String]
      #   @param theme [String]
      #   @param title [String]
    end
  end
end
