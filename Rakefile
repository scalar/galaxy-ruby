# frozen_string_literal: true

require "shellwords"

require "rubocop/rake_task"

multitask(:default) do
  sh(*%w[rake --tasks])
end

xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]
ruby_opt = {"RUBYOPT" => [ENV["RUBYOPT"], "--encoding=UTF-8"].compact.join(" ")}

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

desc("Format `*.rb`")
multitask(:"format:rb") do
  fmt = xargs + %w[rubocop --fail-level F --autocorrect --format simple --]
  sh("#{files["rb", %w[./lib ./examples]].shelljoin} | #{fmt.shelljoin}")
end

desc("Format `*.rbi`")
multitask(:"format:rbi") do
  fmt = xargs + %w[stree write --]
  sh(ruby_opt, "#{files["rbi", %w[./rbi]].shelljoin} | #{fmt.shelljoin}")
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
