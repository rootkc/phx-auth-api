defmodule PhxAuthApi.Auth.Verify do
  import Ecto.Query, warn: false
  alias PhxAuthApi.Repo

  alias PhxAuthApi.Auth.User
  alias PhxAuthApi.Auth.Guardian
  alias Comeonin.Bcrypt

  def authenticate_user(nil, _), do: return_authentication(false, nil)
  def authenticate_user(username, plain_text_password) do
    Repo.get_by(User, username: username)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _), do: return_authentication(false, nil)
  defp check_password(user, plain_text_password) do
    Bcrypt.checkpw(plain_text_password, user.password)
    |> return_authentication(user)
  end

  def return_authentication(true, user), do: Guardian.encode_and_sign(user)
  def return_authentication(false, _), do: {:error, :unauthorized}
end
