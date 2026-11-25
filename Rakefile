# frozen_string_literal: true

require "shellwords"

require "rubocop/rake_task"

multitask(:default) do
  sh(*%w[rake --tasks])
end

xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]
files = ->(ext, dirs) { (%w[find] + dirs + %w[-type f -and -name]) << "*.#{ext}" << "-print0" }

desc("Lint `*.rb(i)`")
multitask(:"lint:rubocop") do
  find = %w[find ./lib ./rbi ./examples -type f -and ( -name *.rb -or -name *.rbi ) -print0]

  rubocop = %w[rubocop]
  rubocop += %w[--format github] if ENV.key?("CI")
  # Some lines cannot be shortened; the generator lays out what it can.
  rubocop += %w[--except Lint/RedundantCopDisableDirective,Layout/LineLength]

  sh("#{find.shelljoin} | #{(xargs + rubocop).shelljoin}")
end

# RuboCop formats both trees. The `*.rbi` files are piped in by name, like the `*.rb` ones: RuboCop
# globs a directory through `AllCops/Include`, which does not list `*.rbi`. The cops that do not
# apply to a signature file are excluded for `**/*.rbi` in `.rubocop.yml`.
fmt = xargs + %w[rubocop --fail-level F --autocorrect --format simple --]

desc("Format `*.rb`")
multitask(:"format:rb") do
  sh("#{files["rb", %w[./lib ./examples]].shelljoin} | #{fmt.shelljoin}")
end

desc("Format `*.rbi`")
multitask(:"format:rbi") do
  sh("#{files["rbi", %w[./rbi]].shelljoin} | #{fmt.shelljoin}")
end

desc("Typecheck `*.rbs`")
multitask(:"typecheck:steep") do
  sh(*%w[steep check])
end

desc("Typecheck `*.rbi`")
multitask(:"typecheck:sorbet") do
  sh(*%w[srb typecheck --dir examples])
end

desc("Lint everything")
multitask(lint: [:"lint:rubocop"])

desc("Format everything")
multitask(format: [:"format:rb", :"format:rbi"])

desc("Typecheck everything")
multitask(typecheck: [:"typecheck:steep", :"typecheck:sorbet"])

# The smoke tests skip unless TEST_API_BASE_URL names a server; see test/smoke_support.rb.
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList["test/**/*_test.rb"]
end
