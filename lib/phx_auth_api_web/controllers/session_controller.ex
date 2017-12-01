defmodule PhxAuthApiWeb.SessionController do
  use PhxAuthApiWeb, :controller

  alias PhxAuthApi.Auth.Verify

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    with {:ok, jwt, resource} <- Verify.authenticate_user(username, password) do
      conn
      |> put_status(:created)
      |> render("show.json", %{session: %{token: jwt, id: resource["sub"]}})
    end
  end
end
