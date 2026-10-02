# frozen_string_literal: true

require_relative "lib/galaxy-ruby/version"

Gem::Specification.new do |spec|
  spec.name = "galaxy-ruby"
  spec.version = ScalarGalaxy::VERSION
  spec.summary = "Ruby library to access the Scalar Galaxy API"
  spec.authors = ["Scalar Galaxy"]
  spec.license = "Apache-2.0"
  spec.homepage = "https://github.com/scalar/galaxy-ruby"
  spec.metadata = {
    "homepage_uri" => "https://github.com/scalar/galaxy-ruby",
    "source_code_uri" => "https://github.com/scalar/galaxy-ruby",
    "rubygems_mfa_required" => "false"
  }
  spec.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "sig/manifest.yaml",
    "README.md",
    "api.md",
    "SECURITY.md",
    "SKILL.md",
    "LICENSE",
    "CHANGELOG.md"
  ]
  spec.extra_rdoc_files = ["README.md"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 3.2"
  spec.add_dependency "base64"
  spec.add_dependency "cgi"
  spec.add_dependency "connection_pool"
  spec.add_dependency "standardwebhooks"
end
