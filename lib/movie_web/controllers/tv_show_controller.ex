defmodule MovieWeb.TVShowController do
  use MovieWeb, :controller

  alias Movie.TVShows

  def index(conn, _params) do
    popular = TVShows.popular()
    top_rated = TVShows.top_rated()
    render(conn, "index.html", popular: popular, top_rated: top_rated)
  end

  def show(conn, %{"id" => id}) do
    tv_show = TVShows.get_tv_show!(id)

    conn
    |> assign(:page_title, "#{tv_show.name} - PhxMovie")
    |> assign(:tv_show, tv_show)
    |> render("show.html")
  end
end
