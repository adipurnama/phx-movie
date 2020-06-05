defmodule MovieWeb.ActorController do
  use MovieWeb, :controller

  alias Movie.Actors

  def index(conn, params) do
    case params do
      %{"page" => "501"} ->
        send_resp(conn, 204, "no content")

      %{"page" => page} ->
        render(conn, "index.html", actors: Actors.popular_actors(page), page: page)

      _ ->
        render(conn, "index.html", actors: Actors.popular_actors(1), page: "1")
    end
  end

  def show(conn, %{"id" => id}) do
    actor = Actors.get_actor!(id)
    social_media = Actors.get_actor_social_media!(id)
    credits = Actors.get_actor_combined_credits!(id)

    conn
    |> assign(:actor, actor)
    |> assign(:social, social_media)
    |> assign(:credits, credits)
    |> render("show.html")
  end
end
