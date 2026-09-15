# typed: strong

module Scalar
  class Client < Scalar::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :bearer_auth

    # Registry
    sig { returns(Scalar::Resources::Registry) }
    attr_reader :registry

    # Schemas
    sig { returns(Scalar::Resources::Schemas) }
    attr_reader :schemas

    # Login Portals
    sig { returns(Scalar::Resources::LoginPortals) }
    attr_reader :login_portals

    # Rules
    sig { returns(Scalar::Resources::Rules) }
    attr_reader :rules

    # Themes
    sig { returns(Scalar::Resources::Themes) }
    attr_reader :themes

    # Teams
    sig { returns(Scalar::Resources::Teams) }
    attr_reader :teams

    # Scalar Docs
    sig { returns(Scalar::Resources::ScalarDocs) }
    attr_reader :scalar_docs

    # Namespaces
    sig { returns(Scalar::Resources::Namespaces) }
    attr_reader :namespaces

    # Authentication
    sig { returns(Scalar::Resources::Authentication) }
    attr_reader :authentication

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        bearer_auth: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["BEARER_AUTH"]`
      bearer_auth: ENV["BEARER_AUTH"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SCALAR_BASE_URL"]`
      base_url: ENV["SCALAR_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Scalar::Client::DEFAULT_MAX_RETRIES,
      timeout: Scalar::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Scalar::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Scalar::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
