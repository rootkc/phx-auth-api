defmodule PhxAuthApi.Auth.AuthPipeline do
  import Canary.Plugs

  alias PhxAuthApi.Auth.User

  use Guardian.Plug.Pipeline, otp_app: :phx_auth_api,
    module: PhxAuthApi.Auth.Guardian,
    error_handler: PhxAuthApi.Auth.AuthErrorHandler

  # Guardian
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: :none
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
  # Canary
  plug PhxAuthApi.Plug.CurrentUser
  plug :authorize_resource, model: User

end
