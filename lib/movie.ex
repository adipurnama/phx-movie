defmodule Movie do
  alias Movie.TMDB.Client

  @moduledoc """
  Movie keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def popular_movies() do
    resp = Client.get!("/movie/popular")
    resp.results
  end

  def now_playing() do
    resp = Client.get!("/movie/now_playing")
    resp.results
  end

  def details(id) do
    "/movie/#{id}"
    |> Client.get!(append_to_response: "credits,videos,images")
  end

  def search(query) do
    "/search/movie"
    |> Client.get(query: query)
  end

  def genres_map() do
    process_genres_data = fn genres ->
      genres
      |> Enum.reduce(%{}, fn g, map ->
        Map.put(map, g.id, g.name)
      end)
    end

    ConCache.fetch_or_store(:moviedb_cache, :genres, fn ->
      case Client.get("/genre/movie/list") do
        {:ok, resp} -> {:ok, process_genres_data.(resp.genres)}
        {:error, _reason} = error -> error
      end
    end)
  end
end
