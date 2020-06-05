import Config

config :movie, Movie, tmdb_api_key: "${TMDB_API_KEY}"

config :movie, MovieWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: nil, port: 443]
