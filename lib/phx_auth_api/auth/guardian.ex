defmodule PhxAuthApi.Auth.Guardian do
  use Guardian, otp_app: :phx_auth_api

  alias PhxAuthApi.Auth

  # return something that identifies the user
  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  # get resource from jwt token
  def resource_from_claims(%{"sub" => uid}) do
    user = Auth.get_user!(uid)
    {:ok, user}
  end

  def resource_from_claims(_) do
    {:error, :invalid_claims}
  end
end
