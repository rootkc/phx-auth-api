defmodule PhxAuthApiWeb.Router do
  use PhxAuthApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxAuthApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/login", SessionController, :login
  end
end
