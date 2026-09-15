# frozen_string_literal: true

require_relative "lib/acme/version"

Gem::Specification.new do |spec|
  spec.name = "acme"
  spec.version = Scalar::VERSION
  spec.summary = "Ruby library to access the Scalar API"
  spec.authors = ["Scalar"]
  spec.license = "Apache-2.0"
  spec.metadata = {
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
  spec.add_dependency "cgi"
  spec.add_dependency "connection_pool"
end
