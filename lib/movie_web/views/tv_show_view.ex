defmodule MovieWeb.TVShowView do
  use MovieWeb, :view
  alias Movie.TVShows

  def formatted_genres(tv_show) do
    case TVShows.genres_map() do
      {:ok, genres} ->
        tv_show.genre_ids
        |> Enum.map(fn id ->
          Map.get(genres, id)
        end)
        |> Enum.join(", ")

      _ ->
        "n/a"
    end
  end

  def poster_image_alt(tv_show) do
    (tv_show.name <> "-poster") |> String.replace(" ", "-") |> String.downcase()
  end

  # def air_year(%{air_date: air_date}), do: Datex.Date.year(air_date)
  # def air_year(%{first_air_date: air_date}), do: Datex.Date.year(air_date)

  def air_year(seasons) when is_list(seasons) do
    first_season = seasons |> List.first()
    Datex.Date.year(first_season.air_date)
  end
end
