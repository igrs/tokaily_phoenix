defmodule TokailyPhoenix.Router do
  use TokailyPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TokailyPhoenix do
    pipe_through :browser # Use the default browser stack
    # top page
    get "/", PageController, :index
    # sign up user
    get  "/sign_up", RegistrationController, :new
    post "/sign_up", RegistrationController, :create
    # login session
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
    # categories
    resources "/categories", CategoryController, except: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TokailyPhoenix do
  #   pipe_through :api
  # end
end
