defmodule Movie.TMDB.Client do
  @moduledoc """
  HTTP API Client to interact with tmdb API
  """
  require Logger

  @base_url "https://api.themoviedb.org/3"
  @default_headers [
    {"content-type", "application/json"}
  ]

  @pool_size 20
  @count_per_pool 2

  def child_spec do
    {
      Finch,
      name: __MODULE__,
      pools: %{
        :default => [size: 11],
        "https://api.themoviedb.org" => [size: @pool_size, count: @count_per_pool]
      }
    }
  end

  def get(path, params \\ []) do
    case Finch.request(__MODULE__, :get, uri_string(path, params), @default_headers) do
      {:ok, resp} ->
        {:ok, resp.body |> Jason.decode!(keys: :atoms)}

      {:error, _reason} = error ->
        error
    end
  end

  def get!(path, params \\ []) do
    {:ok, resp} = Finch.request(__MODULE__, :get, uri_string(path, params), @default_headers)
    resp.body |> Jason.decode!(keys: :atoms)
  end

  defp uri_string(path, params) do
    "#{@base_url}#{path}"
    |> URI.parse()
    |> Map.put(:query, URI.encode_query([api_key: api_key()] ++ params))
    |> URI.to_string()
  end

  defp api_key() do
    Application.get_env(:movie, :tmdb_api_key)
  end
end
