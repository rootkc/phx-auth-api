defmodule PhxAuthApi.Auth.Guardian do
  use Guardian, otp_app: :phx_auth_api

  alias PhxAuthApi.Auth

  # return something that identifies the user
  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  # get resource from jwt token
  def resource_from_claims(claims) do
    user = claims["sub"]
    |> Auth.get_user!
    {:ok, user}
  end
end
