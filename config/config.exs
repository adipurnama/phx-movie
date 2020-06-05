# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :movie, tmdb_api_key: "${TMDB_API_KEY}"

# Configures the endpoint
config :movie, MovieWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6ElNGA2jDJ/XIMCaa9Y2DxtGENPTw6WtqJiGu+R/BqYbTGAsM3Lq8vxV4RQObOtk",
  render_errors: [view: MovieWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Movie.PubSub,
  live_view: [signing_salt: "LZO6Bhez"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
