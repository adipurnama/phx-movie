defmodule Movie.TVShows do
  @moduledoc """
  The TVShows context.
  """
  alias Movie.TMDB.Client

  @doc """
  Returns the list of tv_shows.

  ## Examples

      iex> list_tv_shows()
      [%{}, ...]

  """
  def list_tv_shows do
    raise "TODO"
  end

  def popular do
    resp = Client.get!("/tv/popular")
    resp.results
  end

  def top_rated do
    resp = Client.get!("/tv/top_rated")
    resp.results
  end

  @doc """
  Gets a single tv_show.

  Raises if the Tv show does not exist.

  ## Examples

      iex> get_tv_show!(123)
      %{}

  """
  def get_tv_show!(id) do
    Client.get!("/tv/#{id}", append_to_response: "credits,videos,images")
  end

  def genres_map() do
    process_genres_data = fn genres ->
      genres
      |> Enum.reduce(%{}, fn g, map ->
        Map.put(map, g.id, g.name)
      end)
    end

    ConCache.fetch_or_store(:moviedb_cache, :tv_genres, fn ->
      case Client.get("/genre/tv/list") do
        {:ok, resp} -> {:ok, process_genres_data.(resp.genres)}
        {:error, _reason} = error -> error
      end
    end)
  end
end
