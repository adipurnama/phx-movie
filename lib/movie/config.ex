defmodule Movie.Config do
  @moduledoc """
  This module is reponsible for all runtime config resolution
  """
  use Vapor.Planner

  dotenv()

  config :web,
         env([
           {:port, "PORT", map: &String.to_integer/1, required: false},
           {:secret_key_base, "SECRET_KEY_BASE"},
           {:session_encryption_salt, "SESSION_ENCRYPTION_SALT"},
           {:admin_user, "ADMIN_USER"},
           {:admin_password, "ADMIN_PASSWORD"}
         ])

  config :tmdb,
         env(tmdb_client_api_key: "TMDB_CLIENT_API_KEY")
end
