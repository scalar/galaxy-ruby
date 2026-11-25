# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# RuboCop formats both the `*.rb` and the `*.rbi` tree. Nothing formats `*.rbs`: the Rakefile has no
# such task, so no formatter for it is declared.
group :development do
  # Runs the smoke tests under `test/`.
  gem "minitest"
  gem "rake"
  gem "rbs"
  gem "rubocop"
  gem "sorbet"
  gem "steep"
  gem "tapioca"
end

group :development, :docs do
  gem "redcarpet"
  gem "webrick"
  gem "yard"
end
