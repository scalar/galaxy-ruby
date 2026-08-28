# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# `syntax_tree-rbs` is deliberately absent: it is only needed to format `*.rbs`, the Rakefile has no
# such task, and the reference ships it from a git branch head — an unpinned third-party source every
# `bundle install` would re-resolve. `stree write` formats the `*.rbi` tree with plain `syntax_tree`.
group :development do
  gem "rake"
  gem "rbs"
  gem "rubocop"
  gem "sorbet"
  gem "steep"
  gem "syntax_tree"
  gem "tapioca"
end

group :development, :docs do
  gem "redcarpet"
  gem "webrick"
  gem "yard"
end
