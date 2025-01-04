defmodule LearnPhoenixWeb.Router do
  # Never do this: alias LearnPhoenixWeb.TaskController
  # Otherwise, this will cause: "LearnPhoenixWeb.LearnPhoenixWeb.TaskController.init/1 is undefined"
  use LearnPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LearnPhoenixWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  scope "/api", LearnPhoenixWeb do
    pipe_through :api

    # 4) Make sure you define the appropriate routes in lib/my_app_web/router.ex:
    resources "/tasks", TaskController, only: [:create, :show, :index, :update, :delete]
    resources "/articles", ArticleController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:learn_phoenix, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LearnPhoenixWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
