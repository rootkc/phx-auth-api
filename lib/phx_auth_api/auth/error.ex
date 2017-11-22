defmodule PhxAuthApi.Auth.AuthErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, reason}, _opts), do: auth_error_handler(conn, to_string(type))
  def auth_error(conn), do: auth_error_handler(conn, "unauthenticated")

  defp create_body(type), do: Poison.encode!(%{message: to_string(type)})

  defp auth_error_handler(conn, type) do
    body = create_body(type)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, body)
    |> halt
  end
end
