defmodule PhxAuthApi.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxAuthApi.Auth.User


  schema "users" do
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
  end
end
