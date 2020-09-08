defmodule MovieWeb.ActorView do
  use MovieWeb, :view

  def profile_image_url(%{:profile_path => nil}), do: ""

  def profile_image_url(actor) do
    "https://image.tmdb.org/t/p/w300/" <> actor.profile_path
  end

  def face_image_url(actor) do
    case actor do
      %{profile_path: nil, name: name} ->
        "https://ui-avatars.com/api?size=235&name=" <> name

      %{profile_path: profile_path} ->
        "https://image.tmdb.org/t/p/w235_and_h235_face#{profile_path}"
    end
  end

  def profile_image_alt(actor) do
    actor.name |> String.downcase() |> String.replace(" ", "-")
  end

  def known_for(actor) do
    actor.known_for
    |> Enum.map(fn show ->
      case show do
        %{name: tv_show_title} ->
          tv_show_title

        %{title: movie_title} ->
          movie_title
      end
    end)
    |> Enum.join(", ")
  end

  def known_for_movies(credits) do
    credits.cast
    |> Enum.filter(&(&1.media_type != "tv"))
    |> Enum.sort(&(&1.vote_average > &2.vote_average))
    |> Enum.filter(&(&1.poster_path != nil))
    |> Enum.take(5)
    |> Enum.map(fn show ->
      case show do
        %{title: _} ->
          show
      end
    end)
  end

  def credit_release_year(%{release_date: ""}) do
    ""
  end

  def credit_release_year(credit) do
    Datex.Date.year(credit.release_date)
  end

  def twitter_link(%{twitter_id: id}) do
    "https://twitter.com/#{id}"
  end

  def twitter_link(_), do: nil

  def facebook_link(%{facebook_id: fbid}) do
    "https://facebook.com/#{fbid}"
  end

  def facebook_link(_), do: nil

  def instagram_link(%{instagram_id: igid}) do
    "https://instagram.com/#{igid}"
  end

  def instagram_link(_), do: nil

  def homepage_link(%{homepage: homepage}) do
    homepage
  end

  def homepage_link(_), do: nil

  def age(actor) do
    Datex.Date.compare(actor.birthday)
  end
end
