defmodule MovieWeb.MainController do
  use MovieWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
