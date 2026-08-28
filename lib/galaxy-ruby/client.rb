# frozen_string_literal: true

module ScalarGalaxy
  class Client < ScalarGalaxy::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {production: "https://galaxy.scalar.com", void: "https://void.scalar.com/"}
    # rubocop:enable Style/MutableConstant

    # JWT Bearer token authentication
    # @return [String]
    attr_reader :bearer_auth

    # @return [String]
    attr_reader :basic_auth_username

    # @return [String]
    attr_reader :basic_auth_password

    # API key request header
    # @return [String]
    attr_reader :api_key_header

    # API key query parameter
    # @return [String, nil]
    attr_reader :api_key_query

    # API key browser cookie
    # @return [String]
    attr_reader :api_key_cookie

    # OAuth 2.0 authentication
    # @return [String, nil]
    attr_reader :o_auth2

    # OpenID Connect Authentication
    # @return [String, nil]
    attr_reader :open_id_connect

    # Secret used to verify incoming webhook signatures.
    # @return [String, nil]
    attr_reader :webhook_secret

    # Everything about planets
    # @return [ScalarGalaxy::Resources::Planets]
    attr_reader :planets

    # Celestial bodies are the planets and satellites in the Scalar Galaxy.
    # @return [ScalarGalaxy::Resources::CelestialBodies]
    attr_reader :celestial_bodies

    # Some endpoints are public, but some require authentication. We provide all the
    # required endpoints to create an account and authorize yourself.
    # @return [ScalarGalaxy::Resources::Authentication]
    attr_reader :authentication

    # @return [ScalarGalaxy::Resources::Webhooks]
    attr_reader :webhooks

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {
        **auth_bearer_auth,
        **basic_auth,
        **auth_api_key_header,
        **cookie_auth,
        **auth_o_auth2,
        **auth_open_id_connect
      }
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_bearer_auth
      {"authorization" => "Bearer #{@bearer_auth}"}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def basic_auth
      return {} if @basic_auth_username.nil? || @basic_auth_password.nil?

      base64_credentials = ["#{@basic_auth_username}:#{@basic_auth_password}"].pack("m0")
      {"authorization" => "Basic #{base64_credentials}"}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_api_key_header
      {"x-api-key" => @api_key_header}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def cookie_auth
      cookies = []
      cookies << "api_key=#{@api_key_cookie}" unless @api_key_cookie.nil?
      {"cookie" => cookies.join("; ")}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_o_auth2
      {"authorization" => "Bearer #{@o_auth2}"}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_open_id_connect
      {"authorization" => "Bearer #{@open_id_connect}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param bearer_auth [String, nil] JWT Bearer token authentication Defaults to `ENV["BEARER_AUTH"]`
    #
    # @param basic_auth_username [String, nil] Defaults to `ENV["BASIC_AUTH_USERNAME"]`
    #
    # @param basic_auth_password [String, nil] Defaults to `ENV["BASIC_AUTH_PASSWORD"]`
    #
    # @param api_key_header [String, nil] API key request header Defaults to `ENV["API_KEY_HEADER"]`
    #
    # @param api_key_query [String, nil] API key query parameter Defaults to `ENV["API_KEY_QUERY"]`
    #
    # @param api_key_cookie [String, nil] API key browser cookie Defaults to `ENV["API_KEY_COOKIE"]`
    #
    # @param o_auth2 [String, nil] OAuth 2.0 authentication Defaults to `ENV["SCALAR_O_AUTH2"]`
    #
    # @param open_id_connect [String, nil] OpenID Connect Authentication Defaults to `ENV["SCALAR_OPEN_ID_CONNECT"]`
    #
    # @param webhook_secret [String, nil] Secret used to verify incoming webhook signatures. Defaults to
    # `ENV["SCALAR_WEBHOOK_SECRET"]`
    #
    # @param environment [:production, :void, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `https://galaxy.scalar.com`
    # - `void` corresponds to `https://void.scalar.com/`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["SCALAR_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      bearer_auth: ENV["BEARER_AUTH"],
      basic_auth_username: ENV["BASIC_AUTH_USERNAME"],
      basic_auth_password: ENV["BASIC_AUTH_PASSWORD"],
      api_key_header: ENV["API_KEY_HEADER"],
      api_key_query: ENV["API_KEY_QUERY"],
      api_key_cookie: ENV["API_KEY_COOKIE"],
      o_auth2: ENV["SCALAR_O_AUTH2"],
      open_id_connect: ENV["SCALAR_OPEN_ID_CONNECT"],
      webhook_secret: ENV["SCALAR_WEBHOOK_SECRET"],
      environment: nil,
      base_url: ENV["SCALAR_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||=
        ScalarGalaxy::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
          message =
            "environment must be one of #{ScalarGalaxy::Client::ENVIRONMENTS.keys}, got #{environment}"
          raise ArgumentError.new(message)
        end

      if bearer_auth.nil?
        raise ArgumentError.new("bearer_auth is required, and can be set via environ: \"BEARER_AUTH\"")
      end
      if basic_auth_username.nil?
        raise ArgumentError.new(
          "basic_auth_username is required, and can be set via environ: \"BASIC_AUTH_USERNAME\""
        )
      end
      if basic_auth_password.nil?
        raise ArgumentError.new(
          "basic_auth_password is required, and can be set via environ: \"BASIC_AUTH_PASSWORD\""
        )
      end
      if api_key_header.nil?
        raise ArgumentError.new("api_key_header is required, and can be set via environ: \"API_KEY_HEADER\"")
      end
      if api_key_cookie.nil?
        raise ArgumentError.new("api_key_cookie is required, and can be set via environ: \"API_KEY_COOKIE\"")
      end

      headers = {}
      custom_headers_env = ENV["SCALAR_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env
          .split("\n")
          .each do |line|
            colon = line.index(":")
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip unless colon.nil?
          end
        headers = parsed.merge(headers)
      end

      @bearer_auth = bearer_auth.to_s
      @basic_auth_username = basic_auth_username.to_s
      @basic_auth_password = basic_auth_password.to_s
      @api_key_header = api_key_header.to_s
      @api_key_query = api_key_query&.to_s
      @api_key_cookie = api_key_cookie.to_s
      @o_auth2 = o_auth2&.to_s
      @open_id_connect = open_id_connect&.to_s
      @webhook_secret = webhook_secret&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @planets = ScalarGalaxy::Resources::Planets.new(client: self)
      @celestial_bodies = ScalarGalaxy::Resources::CelestialBodies.new(client: self)
      @authentication = ScalarGalaxy::Resources::Authentication.new(client: self)
      @webhooks = ScalarGalaxy::Resources::Webhooks.new(client: self)
    end
  end
end
