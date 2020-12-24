defmodule MovieWeb.SearchBoxLive do
  @moduledoc """
  SearchBoxLive for search box live view parts of the web
  """
  use MovieWeb, :live_view
  require Logger

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, search_query: "", search_results: [], loading: false, err_msg: "")}
  end

  @impl true
  def render(assigns) do
    MovieWeb.MovieView.render("_searchbox.html", assigns)
  end

  @impl true
  def handle_event("search_keyword", %{"search_query" => ""}, socket) do
    socket = socket |> assign(:search_results, []) |> assign(:search_query, "")
    {:noreply, socket}
  end

  @impl true
  def handle_event("search_keyword", %{"search_query" => query}, socket) do
    send(self(), {:search_api_call, query})

    {:noreply, assign(socket, loading: true)}
  end

  @impl true
  def handle_info({:search_api_call, query}, socket) do
    case Movie.search(query) do
      {:ok, resp} ->
        result = resp.results |> Enum.take(7)

        {:noreply,
         assign(socket, loading: false, search_results: result, search_query: query, err_msg: "")}

      {:error, _} ->
        {:noreply,
         assign(socket,
           loading: false,
           search_results: [],
           search_query: query,
           err_msg: "something bad happened"
         )}
    end
  end
end
