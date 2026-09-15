---
name: scalar-ruby-sdk
description: "Ruby SDK for Scalar API. Use when writing Ruby code that calls Scalar API with the acme package: installing it, constructing and authenticating the client, and calling API operations."
---

# Scalar Ruby SDK

Generated Ruby client for Scalar API, published as `acme`. Use the generated client instead of hand-writing HTTP requests.

## Install

Add the gem to your application's `Gemfile`:

```ruby
gem "acme", "~> 0.1.0" # x-release-please-version
```

Or install it directly:

```sh
gem install acme
```

## Client setup and authentication

```ruby
require "acme"

client = Scalar::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)
```

Provide credentials using the options below. Environment variables are read automatically when the target runtime supports them:

- `bearer_auth` (env: `BEARER_AUTH`) — Credential for the BearerAuth authentication scheme.

## Calling operations

```ruby
require "acme"

client = Scalar::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)

response = client.registry.list_all_api_documents

puts response.inspect
```

Method names, parameter shapes, and response types are generated from the API description — do not guess them. Look up the exact call signature in [api.md](../../../api.md) before writing a call.

## Error handling

Non-success responses throw generated API errors. Error objects expose status, headers, response body, and request metadata where the target runtime supports it.

```ruby
begin
  response = client.registry.list_all_api_documents

  puts response.inspect
rescue Scalar::Errors::APIError => error
  puts "#{error.status}: #{error.message}"
  raise
end
```

## Requirements

- Ruby >= 3.2

## Reference files

- [README.md](../../../README.md) — full feature tour: client options, request options, retries and timeouts.
- [api.md](../../../api.md) — complete catalogue of every operation with request and response types.
