# Scalar Galaxy

This library provides convenient access to the Scalar Galaxy REST API from Ruby.

The full API of this library can be found in [api.md](./api.md).

<br />

## Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](./api.md)
- [Authentication](#authentication)
- [Errors](#errors)
- [Client Options](#client-options)
- [Request Options](#request-options)
- [Retries and Timeouts](#retries-and-timeouts)
- [Helpers](#helpers)
- [Requirements](#requirements)

<br />

## Installation

Add the gem to your application's `Gemfile`:

```ruby
gem "galaxy-ruby", "~> 0.3.0" # x-release-please-version
```

Or install it directly:

```sh
gem install galaxy-ruby
```

<br />

## Usage

```ruby
require "galaxy-ruby"

client = ScalarGalaxy::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)

response = client.planets.list_all_data({ limit: 10, offset: 0 })

puts response.inspect
```

The examples in the following sections assume a `client` configured as shown above.

See the [API reference](./api.md) for every available operation.

<br />

## Authentication

Pass credentials to the generated client constructor. Environment variables are read automatically when supported by the target runtime.

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `bearer_auth` | `String \| nil` | - | JWT Bearer token authentication Defaults to BEARER_AUTH. |
| `basic_auth_username` | `String \| nil` | - | Basic HTTP authentication Defaults to BASIC_AUTH_USERNAME. |
| `basic_auth_password` | `String \| nil` | - | Basic HTTP authentication Defaults to BASIC_AUTH_PASSWORD. |
| `api_key_header` | `String \| nil` | - | API key request header Defaults to API_KEY_HEADER. |
| `api_key_query` | `String \| nil` | - | API key query parameter Defaults to API_KEY_QUERY. |
| `api_key_cookie` | `String \| nil` | - | API key browser cookie Defaults to API_KEY_COOKIE. |
| `o_auth2` | `String \| nil` | - | OAuth 2.0 authentication Defaults to SCALAR_O_AUTH2. |
| `open_id_connect` | `String \| nil` | - | OpenID Connect Authentication Defaults to SCALAR_OPEN_ID_CONNECT. |

Declared schemes:

- `bearerAuth` bearer token
- `basicAuth` basic authentication
- `apiKeyHeader` API key in header `X-API-Key`
- `apiKeyQuery` API key in query `api_key`
- `apiKeyCookie` API key in cookie `api_key`
- `oAuth2` OAuth2/OpenID Connect
- `openIdConnect` OAuth2/OpenID Connect

<br />

## Errors

Non-success responses throw generated API errors. Error objects expose status, headers, response body, and request metadata where the target runtime supports it.

```ruby
begin
  response = client.planets.list_all_data({ limit: 10, offset: 0 })

  puts response.inspect
rescue ScalarGalaxy::Errors::APIError => error
  puts "#{error.status}: #{error.message}"
  raise
end
```

Documented error statuses: `400`, `401`, `403`, `404`, `409`, `422`, `429`.

<br />

## Client Options

Configure the generated client by setting any of these options when you create it.

```ruby
require "galaxy-ruby"

client = ScalarGalaxy::Client.new(
  timeout: 60.0,
  max_retries: 2,
)
```

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `bearer_auth` | `String \| nil` | `ENV["BEARER_AUTH"]` | JWT Bearer token authentication |
| `basic_auth_username` | `String \| nil` | `ENV["BASIC_AUTH_USERNAME"]` | Basic HTTP authentication |
| `basic_auth_password` | `String \| nil` | `ENV["BASIC_AUTH_PASSWORD"]` | Basic HTTP authentication |
| `api_key_header` | `String \| nil` | `ENV["API_KEY_HEADER"]` | API key request header |
| `api_key_query` | `String \| nil` | `ENV["API_KEY_QUERY"]` | API key query parameter |
| `api_key_cookie` | `String \| nil` | `ENV["API_KEY_COOKIE"]` | API key browser cookie |
| `o_auth2` | `String \| nil` | `ENV["SCALAR_O_AUTH2"]` | OAuth 2.0 authentication |
| `open_id_connect` | `String \| nil` | `ENV["SCALAR_OPEN_ID_CONNECT"]` | OpenID Connect Authentication |
| `webhook_secret` | `String \| nil` | `ENV["SCALAR_WEBHOOK_SECRET"]` | Secret used to verify incoming webhook signatures. |
| `environment` | `:production \| :void \| nil` | - | Environment to target; each one maps to a different base URL. |
| `base_url` | `String \| nil` | `ENV["SCALAR_BASE_URL"]` | Override the default API base URL. |
| `max_retries` | `Integer` | `2` | Max number of retries to attempt after a failed retryable request. |
| `timeout` | `Float` | `60.0` | Seconds to wait for a response before timing out. |
| `initial_retry_delay` | `Float` | `0.5` | Seconds to wait before the first retry; later retries back off exponentially. |
| `max_retry_delay` | `Float` | `8.0` | Upper bound, in seconds, on the delay between retries. |

<br />

## Request Options

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `idempotency_key` | `String` | - | Idempotency key for one request, sent when the SDK configures an idempotency header. |
| `extra_query` | `Hash` | - | Additional query parameters for one request. |
| `extra_headers` | `Hash` | - | Additional headers for one request. |
| `extra_body` | `Hash` | - | Additional body fields for one request. |
| `max_retries` | `Integer` | - | Override retry count for one request. |
| `timeout` | `Float` | - | Override timeout for one request. |

<br />

## Retries and Timeouts

Generated clients support request timeouts and retry temporary failures such as network errors, 408, 409, 429, and 5xx responses. Retry delays honor `Retry-After` headers when present. Tune the retry and timeout client options shown above, or override them per request.

<br />

## Helpers

- Every model is a `BaseModel`: pass a plain hash or a model instance, and read decoded values back as attributes.
- The gem ships `rbi/` and `sig/` trees, so Sorbet and Steep type-check calls into the SDK.

<br />

## Requirements

- Ruby >= 3.2

Powered by Scalar.
