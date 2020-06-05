defmodule MovieWeb.MainView do
  use MovieWeb, :view

  def popular_movies() do
    Movie.popular_movies()
  end

  def now_playing() do
    Movie.now_playing()
  end
end
