defmodule Movie.MovieDB.Client do
  @moduledoc """
  HTTP API Client to interact with tmdb API
  """
  require Logger

  @base_url "https://api.themoviedb.org/3"
  @api_key Application.get_env(:movie, :tmdb_api_key)
  @default_headers [
    {"content-type", "application/json"}
  ]

  def get(path, params \\ []) do
    case Mojito.request(method: :get, url: uri_string(path, params), headers: @default_headers) do
      {:ok, resp} ->
        {:ok, resp.body |> Jason.decode!(keys: :atoms)}

      {:error, _reason} = error ->
        error
    end
  end

  def get!(path, params \\ []) do
    {:ok, resp} = Mojito.get(uri_string(path, params), @default_headers)
    resp.body |> Jason.decode!(keys: :atoms)
  end

  defp uri_string(path, params) do
    Logger.info("API_KEY=#{@api_key}")

    "#{@base_url}#{path}"
    |> URI.parse()
    |> Map.put(:query, URI.encode_query([api_key: @api_key] ++ params))
    |> URI.to_string()
  end
end
