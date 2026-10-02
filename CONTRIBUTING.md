# Contributing

## Setting up the environment

This repository contains a `.ruby-version` file, which works with either
[rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) with the
[ruby plugin](https://github.com/asdf-vm/asdf-ruby). Follow the instructions for your preferred
version manager to install the Ruby version it names, then run:

```bash
$ ./scripts/bootstrap
```

## Modifying the code

Most of this SDK is generated. Edits to generated files are overwritten the next time the SDK is
regenerated, so changes belong either in the OpenAPI document and SDK config the generator reads, or
in hand-written files the generator does not emit — regeneration only rewrites the files it emits,
and never deletes the rest.

## Adding and running examples

Files under `examples/` are never modified by the generator.

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/galaxy-ruby"

# ...
```

```bash
$ ruby ./examples/<your-example>.rb
```

## Using the repository from source

To install from git in your `Gemfile`:

```ruby
gem "galaxy-ruby", git: "<repository url>"
```

Or reference a local checkout:

```ruby
gem "galaxy-ruby", path: "/path/to/galaxy-ruby"
```

## Linting, formatting, and typechecking

```bash
$ ./scripts/lint
$ ./scripts/format
$ bundle exec rake typecheck
```
