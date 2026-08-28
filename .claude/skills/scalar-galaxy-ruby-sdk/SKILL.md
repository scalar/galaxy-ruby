---
name: scalar-galaxy-ruby-sdk
description: "Ruby SDK for Scalar Galaxy API. Use when writing Ruby code that calls Scalar Galaxy API with the galaxy-ruby package: installing it, constructing and authenticating the client, and calling API operations."
---

# Scalar Galaxy Ruby SDK

Generated Ruby client for Scalar Galaxy API, published as `galaxy-ruby`. Use the generated client instead of hand-writing HTTP requests.

## Install

Add the gem to your application's `Gemfile`:

```ruby
gem "galaxy-ruby", "~> 0.2.0" # x-release-please-version
```

Or install it directly:

```sh
gem install galaxy-ruby
```

## Client setup and authentication

```ruby
require "galaxy-ruby"

client = ScalarGalaxy::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)
```

Provide credentials using the options below. Environment variables are read automatically when the target runtime supports them:

- `bearer_auth` (env: `BEARER_AUTH`) — JWT Bearer token authentication
- `basic_auth_username` (env: `BASIC_AUTH_USERNAME`) — Basic HTTP authentication
- `basic_auth_password` (env: `BASIC_AUTH_PASSWORD`) — Basic HTTP authentication
- `api_key_header` (env: `API_KEY_HEADER`) — API key request header
- `api_key_query` (env: `API_KEY_QUERY`) — API key query parameter
- `api_key_cookie` (env: `API_KEY_COOKIE`) — API key browser cookie
- `o_auth2` (env: `SCALAR_O_AUTH2`) — OAuth 2.0 authentication
- `open_id_connect` (env: `SCALAR_OPEN_ID_CONNECT`) — OpenID Connect Authentication

## Calling operations

```ruby
require "galaxy-ruby"

client = ScalarGalaxy::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)

response = client.planets.list_all_data({ limit: 10, offset: 0 })

puts response.inspect
```

Method names, parameter shapes, and response types are generated from the API description — do not guess them. Look up the exact call signature in [api.md](../../../api.md) before writing a call.

## Error handling

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

## Requirements

- Ruby >= 3.2

## Reference files

- [README.md](../../../README.md) — full feature tour: client options, request options, retries and timeouts.
- [api.md](../../../api.md) — complete catalogue of every operation with request and response types.
