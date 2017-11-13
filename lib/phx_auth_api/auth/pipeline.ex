defmodule PhxAuthApi.Auth.AuthPipeline do

  use Guardian.Plug.Pipeline, otp_app: :phx_auth_api,
    module: PhxAuthApi.Auth.Guradian,
    error_handler: PhxAuthApi.Auth.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: :none
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true

end
