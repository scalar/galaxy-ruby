# typed: strong

module Scalar
  module Models
    class LoginPortalPage < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Scalar::LoginPortalPage, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :company_name

      sig { returns(String) }
      attr_accessor :description

      sig { returns(String) }
      attr_accessor :favicon

      sig { returns(String) }
      attr_accessor :form_description

      sig { returns(String) }
      attr_accessor :form_image

      sig { returns(String) }
      attr_accessor :form_title

      sig { returns(String) }
      attr_accessor :head

      sig { returns(String) }
      attr_accessor :logo

      sig { returns(String) }
      attr_accessor :logo_url

      sig { returns(String) }
      attr_accessor :privacy_link

      sig { returns(String) }
      attr_accessor :script

      sig { returns(String) }
      attr_accessor :terms_link

      sig { returns(String) }
      attr_accessor :theme

      sig { returns(String) }
      attr_accessor :title

      sig do
        params(
          company_name: String,
          description: String,
          favicon: String,
          form_description: String,
          form_image: String,
          form_title: String,
          head: String,
          logo: String,
          logo_url: String,
          privacy_link: String,
          script: String,
          terms_link: String,
          theme: String,
          title: String
        ).returns(T.attached_class)
      end
      def self.new(
        company_name:,
        description:,
        favicon:,
        form_description:,
        form_image:,
        form_title:,
        head:,
        logo:,
        logo_url:,
        privacy_link:,
        script:,
        terms_link:,
        theme:,
        title:
      )
      end

      sig do
        override.returns(
          {
            company_name: String,
            description: String,
            favicon: String,
            form_description: String,
            form_image: String,
            form_title: String,
            head: String,
            logo: String,
            logo_url: String,
            privacy_link: String,
            script: String,
            terms_link: String,
            theme: String,
            title: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
