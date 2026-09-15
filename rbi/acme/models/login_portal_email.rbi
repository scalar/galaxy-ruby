# typed: strong

module Scalar
  module Models
    class LoginPortalEmail < Scalar::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Scalar::LoginPortalEmail, Scalar::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :button_background

      sig { returns(String) }
      attr_accessor :button_color

      sig { returns(String) }
      attr_accessor :button_text

      sig { returns(String) }
      attr_accessor :card_background

      sig { returns(String) }
      attr_accessor :card_color

      sig { returns(String) }
      attr_accessor :logo

      sig { returns(String) }
      attr_accessor :logo_size

      sig { returns(String) }
      attr_accessor :main_background

      sig { returns(String) }
      attr_accessor :main_color

      sig { returns(String) }
      attr_accessor :message

      sig { returns(String) }
      attr_accessor :title

      sig do
        params(
          button_background: String,
          button_color: String,
          button_text: String,
          card_background: String,
          card_color: String,
          logo: String,
          logo_size: String,
          main_background: String,
          main_color: String,
          message: String,
          title: String
        ).returns(T.attached_class)
      end
      def self.new(
        button_background:,
        button_color:,
        button_text:,
        card_background:,
        card_color:,
        logo:,
        logo_size:,
        main_background:,
        main_color:,
        message:,
        title:
      )
      end

      sig do
        override.returns(
          {
            button_background: String,
            button_color: String,
            button_text: String,
            card_background: String,
            card_color: String,
            logo: String,
            logo_size: String,
            main_background: String,
            main_color: String,
            message: String,
            title: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
