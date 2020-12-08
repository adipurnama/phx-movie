defmodule Movie.Actors do
  @moduledoc false
  alias Movie.TMDB.Client

  @doc """
  Returns the list of actors.

  ## Examples

      iex> list_actors()
      [%Actor{}, ...]

  """
  def list_actors do
    resp = Client.get!("/person/popular")
    resp.results
  end

  def popular_actors(page) do
    resp = Client.get!("/person/popular", page: page)
    resp.results
  end

  @doc """
  Gets a single actor.

  Raises if the Actor does not exist.

  ## Examples

      iex> get_actor!(123)
      %Actor{}

  """
  def get_actor!(id) do
    Client.get!("/person/#{id}")
  end

  def get_actor_social_media!(id) do
    Client.get!("/person/#{id}/external_ids")
  end

  def get_actor_combined_credits!(id) do
    Client.get!("/person/#{id}/combined_credits")
  end
end
