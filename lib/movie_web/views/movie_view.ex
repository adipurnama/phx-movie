defmodule MovieWeb.MovieView do
  use MovieWeb, :view

  def formatted_date(nil), do: "N/A"
  def formatted_date(""), do: "N/A"

  def formatted_date(date) do
    Date.from_iso8601!(date)
    |> Datex.Date.add(0, :nice_short_date)
  end

  def release_year(%{:release_date => ""}), do: "N/A"

  def release_year(movie) do
    Date.from_iso8601!(movie.release_date)
    |> Datex.Date.year()
  end

  def poster_image_url(movie) do
    "https://image.tmdb.org/t/p/w500/#{movie.poster_path}"
  end

  def detail_poster_image_url(movie) do
    "https://image.tmdb.org/t/p/w780/#{movie.poster_path}"
  end

  def poster_image_alt(movie) do
    (movie.title <> "-poster") |> String.replace(" ", "-") |> String.downcase()
  end

  def searchbox_poster_image_url(%{:poster_path => nil}), do: ""

  def searchbox_poster_image_url(movie) do
    "https://image.tmdb.org/t/p/w92/#{movie.poster_path}"
  end

  def top_crew(movie, take \\ 2) do
    movie.credits.crew
    |> Enum.uniq_by(fn c -> c.id end)
    |> Enum.uniq_by(fn c -> c.department end)
    |> Enum.sort(fn c1, c2 ->
      c1.id >= c2.id
    end)
    |> Enum.take(take)
  end

  def displayed_cast(movie, take \\ 10) do
    movie.credits.cast
    |> Enum.filter(fn c ->
      c.profile_path != nil
    end)
    |> Enum.take(take)
  end

  def youtube_trailer_url(movie) do
    case movie.videos.results do
      [%{key: key} | _rest] ->
        key

      [] ->
        ""
    end
  end

  def formatted_genres(movie) do
    case Movie.genres_map() do
      {:ok, genres} ->
        movie.genre_ids
        |> Enum.map(fn id ->
          Map.get(genres, id)
        end)
        |> Enum.join(", ")

      _ ->
        "n/a"
    end
  end

  def movie_image_uris(movie) do
    movie.images.backdrops
    |> Enum.take(8)
    |> Enum.map(fn img ->
      %{
        thumbnail: "https://image.tmdb.org/t/p/w500/#{img.file_path}",
        large: "https://image.tmdb.org/t/p/original/#{img.file_path}"
      }
    end)
  end
end
