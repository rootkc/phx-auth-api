# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_auth_api,
  ecto_repos: [PhxAuthApi.Repo]

# Configures the endpoint
config :phx_auth_api, PhxAuthApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FxQO/cevvYdpGYEN/m3gYdjfLq0QZY2/HM7yid35mHEPhGDIC14dKIyl/5HO9/Up",
  render_errors: [view: PhxAuthApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhxAuthApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :phx_auth_api, PhxAuthApi.Auth.Guardian,
  issuer: "phx_auth_api",
  secret_key: "L7XjzucoEAx6/LURV8h8hdWaaGIf5HQu4o8J2Jhyh5zJAmbEZoOFdlZIdXqDy1fT"

# Configures Canary
config :canary, repo: PhxAuthApi.Repo,
unauthorized_handler: {PhxAuthApi.Auth.AuthErrorHandler, :auth_error}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
