defmodule PhxAuthApiWeb.SessionController do
  use PhxAuthApiWeb, :controller

  alias PhxAuthApi.Auth.Validate
  alias PhxAuthApi.Auth.Guardian

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    with {:ok, user} <- Validate.authenticate_user(username, password),
         {:ok, jwt, _} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("show.json", session: jwt)
    else {:error, error} ->
      conn
      |> put_status(:unauthorized)
      |> render("show.json", session: error)
    end
  end
end
