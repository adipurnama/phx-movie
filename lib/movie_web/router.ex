defmodule MovieWeb.Router do
  use MovieWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MovieWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin_only do
    import Plug.BasicAuth

    plug :basic_auth,
      username: System.get_env("ADMIN_USER"),
      password: System.get_env("ADMIN_PASSWORD")
  end

  scope "/", MovieWeb do
    pipe_through :browser

    # live "/", PageLive, :index
    get "/", MainController, :index
    get "/movies/:id", MovieController, :show

    get "/actors", ActorController, :index
    get "/actors/:id", ActorController, :show

    get "/tv-shows", TVShowController, :index
    get "/tv-shows/:id", TVShowController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", MovieWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: MovieWeb.Telemetry
    end
  else
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:browser, :admin_only]

      live_dashboard "/dashboard", metrics: MovieWeb.Telemetry
    end
  end
end
