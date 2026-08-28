# frozen_string_literal: true

require "yaml"

target(:lib) do
  configure_code_diagnostics(Steep::Diagnostic::Ruby.strict)

  # Signatures only, so the manifest below is all this needs. Adding `check("lib")` would also mean
  # loading the libraries the runtime itself calls into (`cgi`, `erb`, `json`, `securerandom`).
  signature("sig")

  # `sig/manifest.yaml` ships in the gem for `rbs collection`; reading it back here keeps a local
  # `steep check` on exactly the libraries consumers resolve. Relative to `__dir__` because `steep`
  # does not chdir to the Steepfile, so a bare path only works from the gem root.
  manifest = YAML.safe_load_file(File.expand_path("sig/manifest.yaml", __dir__))
  manifest.fetch("dependencies").each { library(_1.fetch("name")) }
end
