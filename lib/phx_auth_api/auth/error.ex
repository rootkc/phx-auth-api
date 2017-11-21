defmodule PhxAuthApi.Auth.AuthErrorHandler do
  import Plug.Conn

  def create_body(type), do: Poison.encode!(%{message: to_string(type)})

  def auth_error(conn, {type, reason}, _opts) do
    body = create_body(to_string(type))
    conn
    |> send_resp(401, body)
    |> halt
  end

  def auth_error(conn) do
    body = create_body("unauthenticated")
    conn
    |> send_resp(401, body)
    |> halt
  end
end
