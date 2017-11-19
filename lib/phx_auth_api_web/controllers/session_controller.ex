defmodule PhxAuthApiWeb.SessionController do
  use PhxAuthApiWeb, :controller

  alias PhxAuthApi.Auth.Validate

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    with {:ok, jwt, _} <- Validate.authenticate_user(username, password) do
      conn
      |> put_status(:created)
      |> render("show.json", session: jwt)
    end
  end
end
