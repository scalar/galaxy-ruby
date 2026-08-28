# frozen_string_literal: true

module ScalarGalaxy
  module Internal
    extend ScalarGalaxy::Internal::Util::SorbetRuntimeSupport

    OMIT =
      Object.new.tap { _1.define_singleton_method(:inspect) { "#<#{ScalarGalaxy::Internal}::OMIT>" } }.freeze

    define_sorbet_constant!(:AnyHash) { T.type_alias { T::Hash[Symbol, T.anything] } }
    define_sorbet_constant!(:FileInput) do
      T.type_alias { T.any(Pathname, StringIO, IO, String, ScalarGalaxy::FilePart) }
    end
  end
end
