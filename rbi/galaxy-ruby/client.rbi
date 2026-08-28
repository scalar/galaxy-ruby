# typed: strong

module ScalarGalaxy
  class Client < ScalarGalaxy::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          production: "https://galaxy.scalar.com",
          void: "https://void.scalar.com/"
        },
        T::Hash[Symbol, String]
      )

    sig { returns(String) }
    attr_reader :bearer_auth

    sig { returns(String) }
    attr_reader :basic_auth_username

    sig { returns(String) }
    attr_reader :basic_auth_password

    sig { returns(String) }
    attr_reader :api_key_header

    sig { returns(T.nilable(String)) }
    attr_reader :api_key_query

    sig { returns(String) }
    attr_reader :api_key_cookie

    sig { returns(T.nilable(String)) }
    attr_reader :o_auth2

    sig { returns(T.nilable(String)) }
    attr_reader :open_id_connect

    sig { returns(T.nilable(String)) }
    attr_reader :webhook_secret

    # Everything about planets
    sig { returns(ScalarGalaxy::Resources::Planets) }
    attr_reader :planets

    # Celestial bodies are the planets and satellites in the Scalar Galaxy.
    sig { returns(ScalarGalaxy::Resources::CelestialBodies) }
    attr_reader :celestial_bodies

    # Some endpoints are public, but some require authentication. We provide all the
    # required endpoints to create an account and authorize yourself.
    sig { returns(ScalarGalaxy::Resources::Authentication) }
    attr_reader :authentication

    sig { returns(ScalarGalaxy::Resources::Webhooks) }
    attr_reader :webhooks

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        bearer_auth: T.nilable(String),
        basic_auth_username: T.nilable(String),
        basic_auth_password: T.nilable(String),
        api_key_header: T.nilable(String),
        api_key_query: T.nilable(String),
        api_key_cookie: T.nilable(String),
        o_auth2: T.nilable(String),
        open_id_connect: T.nilable(String),
        webhook_secret: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # JWT Bearer token authentication Defaults to `ENV["BEARER_AUTH"]`
      bearer_auth: ENV["BEARER_AUTH"],
      # Defaults to `ENV["BASIC_AUTH_USERNAME"]`
      basic_auth_username: ENV["BASIC_AUTH_USERNAME"],
      # Defaults to `ENV["BASIC_AUTH_PASSWORD"]`
      basic_auth_password: ENV["BASIC_AUTH_PASSWORD"],
      # API key request header Defaults to `ENV["API_KEY_HEADER"]`
      api_key_header: ENV["API_KEY_HEADER"],
      # API key query parameter Defaults to `ENV["API_KEY_QUERY"]`
      api_key_query: ENV["API_KEY_QUERY"],
      # API key browser cookie Defaults to `ENV["API_KEY_COOKIE"]`
      api_key_cookie: ENV["API_KEY_COOKIE"],
      # OAuth 2.0 authentication Defaults to `ENV["SCALAR_O_AUTH2"]`
      o_auth2: ENV["SCALAR_O_AUTH2"],
      # OpenID Connect Authentication Defaults to `ENV["SCALAR_OPEN_ID_CONNECT"]`
      open_id_connect: ENV["SCALAR_OPEN_ID_CONNECT"],
      # Secret used to verify incoming webhook signatures. Defaults to
      # `ENV["SCALAR_WEBHOOK_SECRET"]`
      webhook_secret: ENV["SCALAR_WEBHOOK_SECRET"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `https://galaxy.scalar.com`
      # - `void` corresponds to `https://void.scalar.com/`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["SCALAR_BASE_URL"]`
      base_url: ENV["SCALAR_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: ScalarGalaxy::Client::DEFAULT_MAX_RETRIES,
      timeout: ScalarGalaxy::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: ScalarGalaxy::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: ScalarGalaxy::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
