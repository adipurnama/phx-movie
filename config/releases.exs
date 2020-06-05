import Config

config :movie, tmdb_api_key: System.get_env("TMDB_API_KEY")
# config :movie, tmdb_api_key: "${TMDB_API_KEY}"

config :movie, MovieWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: nil, port: 443]
