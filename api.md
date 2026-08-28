# Scalar Galaxy Ruby API

Complete reference of every operation, grouped by resource. See [the README](./README.md) for usage and configuration.

## Contents

- [`Planets`](#planets)
  - [Get all planets](#get-all-planets)
  - [Create a planet](#create-a-planet)
  - [Get a planet](#get-a-planet)
  - [Update a planet](#update-a-planet)
  - [Delete a planet](#delete-a-planet)
  - [Upload an image to a planet](#upload-an-image-to-a-planet)
- [`CelestialBodies`](#celestialbodies)
  - [Create a celestial body](#create-a-celestial-body)
- [`Authentication`](#authentication)
  - [Create a user](#create-a-user)
  - [Get a token](#get-a-token)
  - [Get authenticated user](#get-authenticated-user)

## Setup

```ruby
require "galaxy-ruby"

client = ScalarGalaxy::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)
```

## `Planets`

Everything about planets

### Get all planets

It's easy to say you know them all, but do you really? Retrieve all the planets and check whether you missed one.

| Direction | Type |
| --- | --- |
| Request | [`PlanetListAllDataParams`](././lib/galaxy-ruby/models/planet_list_all_data_params.rb) |
| Response | [`PlanetListAllDataResponse`](././lib/galaxy-ruby/models/planet_list_all_data_response.rb) |

```ruby
response = client.planets.list_all_data({ limit: 10, offset: 0 })

puts response.inspect
```

### Create a planet

Time to play god and create a new planet. What do you think? Ah, don't think too much. What could go wrong anyway?

| Direction | Type |
| --- | --- |
| Request | [`PlanetCreateParams`](././lib/galaxy-ruby/models/planet_create_params.rb) |
| Response | [`Planet`](././lib/galaxy-ruby/models/planet.rb) |

```ruby
response = client.planets.create({ id: 1, name: "Mars", atmosphere: [], creator: {  }, description: "The red planet", discovered_at: "1610-01-07T00:00:00Z", failure_callback_url: "https://example.com/webhook", habitability_index: 0.68, image: "https://cdn.scalar.com/photos/mars.jpg", last_updated: "2024-01-15T14:30:00Z", physical_properties: {  }, satellites: [], success_callback_url: "https://example.com/webhook", tags: [], type: "terrestrial" })

puts response.inspect
```

### Get a planet

You'll better learn a little bit more about the planets. It might come in handy once space travel is available for everyone.

| Direction | Type |
| --- | --- |
| Request | [`PlanetRetrieveParams`](././lib/galaxy-ruby/models/planet_retrieve_params.rb) |
| Response | [`Planet`](././lib/galaxy-ruby/models/planet.rb) |

```ruby
response = client.planets.retrieve(1)

puts response.inspect
```

### Update a planet

Sometimes you make mistakes, that's fine. No worries, you can update all planets.

| Direction | Type |
| --- | --- |
| Request | [`PlanetUpdateParams`](././lib/galaxy-ruby/models/planet_update_params.rb) |
| Response | [`Planet`](././lib/galaxy-ruby/models/planet.rb) |

```ruby
response = client.planets.update(1, { id: 1, name: "Mars", atmosphere: [], creator: {  }, description: "The red planet", discovered_at: "1610-01-07T00:00:00Z", failure_callback_url: "https://example.com/webhook", habitability_index: 0.68, image: "https://cdn.scalar.com/photos/mars.jpg", last_updated: "2024-01-15T14:30:00Z", physical_properties: {  }, satellites: [], success_callback_url: "https://example.com/webhook", tags: [], type: "terrestrial" })

puts response.inspect
```

### Delete a planet

This endpoint was used to delete planets. Unfortunately, that caused a lot of trouble for planets with life. So, this endpoint is now deprecated and should not be used anymore.

| Direction | Type |
| --- | --- |
| Request | [`PlanetDeleteParams`](././lib/galaxy-ruby/models/planet_delete_params.rb) |

```ruby
client.planets.delete(1)
```

### Upload an image to a planet

Got a crazy good photo of a planet? Share it with the world!

| Direction | Type |
| --- | --- |
| Request | [`PlanetDelteImageParams`](././lib/galaxy-ruby/models/planet_delte_image_params.rb) |
| Response | [`PlanetDelteImageResponse`](././lib/galaxy-ruby/models/planet_delte_image_response.rb) |

```ruby
response = client.planets.delte_image(1, { image: "@mars.jpg" })

puts response.inspect
```

## `CelestialBodies`

Celestial bodies are the planets and satellites in the Scalar Galaxy.

### Create a celestial body

Stars, moons, comets, the occasional rogue asteroid — if it glows or drifts through the void, you can add it here.

| Direction | Type |
| --- | --- |
| Request | [`CelestialBodyCreateParams`](././lib/galaxy-ruby/models/celestial_body_create_params.rb) |
| Response | [`CelestialBody`](././lib/galaxy-ruby/models/celestial_body.rb) |

```ruby
response = client.celestial_bodies.create({ celestial_body: { "name" => "Mars" } })

puts response.inspect
```

## `Authentication`

Some endpoints are public, but some require authentication. We provide all the required endpoints to create an account and authorize yourself.

### Create a user

Time to create a user account, eh?

| Direction | Type |
| --- | --- |
| Request | [`AuthenticationCreateUserParams`](././lib/galaxy-ruby/models/authentication_create_user_params.rb) |
| Response | [`User`](././lib/galaxy-ruby/models/user.rb) |

```ruby
response = client.authentication.create_user({ email: "marc@scalar.com", password: "i-love-scalar", name: "Marc" })

puts response.inspect
```

### Get a token

Yeah, this is the boring security stuff. Just get your super secret token and move on.

| Direction | Type |
| --- | --- |
| Request | [`AuthenticationCreateTokenParams`](././lib/galaxy-ruby/models/authentication_create_token_params.rb) |
| Response | [`AuthenticationCreateTokenResponse`](././lib/galaxy-ruby/models/authentication_create_token_response.rb) |

```ruby
response = client.authentication.create_token({ email: "marc@scalar.com", password: "i-love-scalar" })

puts response.inspect
```

### Get authenticated user

Find yourself they say. That's what you can do here.

| Direction | Type |
| --- | --- |
| Request | [`AuthenticationListMeParams`](././lib/galaxy-ruby/models/authentication_list_me_params.rb) |
| Response | [`User`](././lib/galaxy-ruby/models/user.rb) |

```ruby
response = client.authentication.list_me

puts response.inspect
```
