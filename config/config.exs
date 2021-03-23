# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bramble_engineering,
  ecto_repos: [BrambleEngineering.Repo]

# Configures the endpoint
config :bramble_engineering, BrambleEngineeringWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hyU8IQjIgSfRYOW8o7MEiNWpLr3hoPWGpbV/DUt5qeWKs753yFE5MyT/1KjmMB/L",
  render_errors: [view: BrambleEngineeringWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BrambleEngineering.PubSub,
  live_view: [signing_salt: "xCaO99id"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
