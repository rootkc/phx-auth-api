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
  secret_key_base: "J8hk2twWAzAdHnjIYVoE2uFLOxqCsRk8nRl3v16/g+ouKDfn6s9ail2+wuwXrVjN",
  render_errors: [view: PhxAuthApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhxAuthApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
