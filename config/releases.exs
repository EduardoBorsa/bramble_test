# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

config :bramble_engineering, BrambleEngineering.Repo,
  username: "postgres",
  password: "postgres",
  database: "bramble_engineering",
  hostname: "db",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :bramble_engineering, BrambleEngineeringWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  secret_key_base: "eZG/WGvxW6eyhpYze8WgA0j4kMjjh7gPcJ2I59xDyLm7mJbhoxGMe+maYo9soxty",
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :bramble_engineering, BrambleEngineeringWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
