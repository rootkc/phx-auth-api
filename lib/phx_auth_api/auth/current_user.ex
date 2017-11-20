defmodule PhxAuthApi.Plug.CurrentUser do
  alias PhxAuthApi.Auth.Guardian
  def init(opts), do: opts

  # this plug is necessary to add the current ressource from the token to the :current_user for canary
  def call(conn, _opts) do
    current_user = Guardian.Plug.current_resource(conn)
    Plug.Conn.assign(conn, :current_user, current_user)
  end
end
