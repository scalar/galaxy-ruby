# typed: strong

module ScalarGalaxy
  module Resources
    # Some endpoints are public, but some require authentication. We provide all the
    # required endpoints to create an account and authorize yourself.
    class Authentication
      # Yeah, this is the boring security stuff. Just get your super secret token and
      # move on.
      sig do
        params(
          email: String,
          password: String,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::Models::AuthenticationCreateTokenResponse)
      end
      def create_token(email:, password:, request_options: {})
      end

      # Time to create a user account, eh?
      sig do
        params(
          email: String,
          password: String,
          name: String,
          request_options: ScalarGalaxy::RequestOptions::OrHash
        ).returns(ScalarGalaxy::User)
      end
      def create_user(email:, password:, name: nil, request_options: {})
      end

      # Find yourself they say. That's what you can do here.
      sig do
        params(request_options: ScalarGalaxy::RequestOptions::OrHash).returns(
          ScalarGalaxy::User
        )
      end
      def list_me(request_options: {})
      end

      # @api private
      sig { params(client: ScalarGalaxy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
