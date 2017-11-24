defmodule PhxAuthApi.AuthTest do
  use PhxAuthApi.DataCase

  alias PhxAuthApi.Auth

  alias PhxAuthApi.Auth.User

  @valid_attrs %{password: "some password", username: "some username"}
  @update_attrs %{password: "some updated password", username: "some updated username"}
  @invalid_attrs %{password: nil, username: nil}

  describe "users" do
    setup :create_user

    test "list_users/0 returns all users", %{user: user} do
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id", %{user: user} do
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user", %{user: user} do
      assert {:ok, user} = Auth.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset", %{user: user} do
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user", %{user: user} do
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset", %{user: user} do
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end
  def create_user(_params) do
    {:ok, user} = Auth.create_user(@valid_attrs)
    {:ok, user: user}
  end
end
