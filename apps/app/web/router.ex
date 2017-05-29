defmodule App.Router do
  use App.Web, :router

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

  scope "/", App do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :index
    get "/registration", RegistrationController, :index
    post "/registration", RegistrationController, :register
    post "/search", SearchController, :search
    resources "/articles", ArticleController
    resources "/categories", CategoryController
    resources "/users", UserController
    resources "/department", DepartmentController
    resources "/tags", TagController
  end

  # Other scopes may use custom stacks.
  # scope "/api", App do
  #   pipe_through :api
  # end
end
