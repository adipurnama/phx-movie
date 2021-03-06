defmodule MovieWeb.MovieController do
  use MovieWeb, :controller

  def show(conn, %{"id" => movie_id}) do
    movie = Movie.details(movie_id)

    conn
    |> assign(:movie, movie)
    |> assign(:page_title, "#{movie.title} - PhxMovie")
    |> render("show.html")
  end
end
