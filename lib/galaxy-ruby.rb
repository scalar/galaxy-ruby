# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "openssl"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) && caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"
require "standardwebhooks"

# Package files.
require_relative "galaxy-ruby/version"
require_relative "galaxy-ruby/internal/util"
require_relative "galaxy-ruby/internal/type/converter"
require_relative "galaxy-ruby/internal/type/unknown"
require_relative "galaxy-ruby/internal/type/boolean"
require_relative "galaxy-ruby/internal/type/file_input"
require_relative "galaxy-ruby/internal/type/enum"
require_relative "galaxy-ruby/internal/type/union"
require_relative "galaxy-ruby/internal/type/array_of"
require_relative "galaxy-ruby/internal/type/hash_of"
require_relative "galaxy-ruby/internal/type/base_model"
require_relative "galaxy-ruby/internal/type/base_page"
require_relative "galaxy-ruby/internal/type/request_parameters"
require_relative "galaxy-ruby/internal"
require_relative "galaxy-ruby/request_options"
require_relative "galaxy-ruby/file_part"
require_relative "galaxy-ruby/errors"
require_relative "galaxy-ruby/internal/transport/base_client"
require_relative "galaxy-ruby/internal/transport/pooled_net_requester"
require_relative "galaxy-ruby/client"
require_relative "galaxy-ruby/models/credentials"
require_relative "galaxy-ruby/models/planet"
require_relative "galaxy-ruby/models/authentication_create_token_params"
require_relative "galaxy-ruby/models/authentication_create_token_response"
require_relative "galaxy-ruby/models/authentication_create_user_params"
require_relative "galaxy-ruby/models/authentication_list_me_params"
require_relative "galaxy-ruby/models/celestial_body"
require_relative "galaxy-ruby/models/celestial_body_create_params"
require_relative "galaxy-ruby/models/new_planet_webhook_event"
require_relative "galaxy-ruby/models/planet_create_params"
require_relative "galaxy-ruby/models/planet_delete_params"
require_relative "galaxy-ruby/models/planet_delte_image_params"
require_relative "galaxy-ruby/models/planet_delte_image_response"
require_relative "galaxy-ruby/models/planet_list_all_data_params"
require_relative "galaxy-ruby/models/planet_list_all_data_response"
require_relative "galaxy-ruby/models/planet_retrieve_params"
require_relative "galaxy-ruby/models/planet_update_params"
require_relative "galaxy-ruby/models/unwrap_webhook_event"
require_relative "galaxy-ruby/models/user"
require_relative "galaxy-ruby/models/webhook_unwrap_params"
require_relative "galaxy-ruby/models"
require_relative "galaxy-ruby/resources/planets"
require_relative "galaxy-ruby/resources/celestial_bodies"
require_relative "galaxy-ruby/resources/authentication"
require_relative "galaxy-ruby/resources/webhooks"
