defmodule PhxAuthApi.VerifyTest do
  use PhxAuthApi.DataCase

  alias PhxAuthApi.Auth
  alias PhxAuthApi.Auth.Verify

  @user_attrs %{username: "some username", password: "some password"}
  @invalid_attrs %{password: nil, username: nil}

  describe("authenticate_user/2") do
    setup :create_user

    test "with a valid user" do
      assert {:ok, _, _} = Verify.authenticate_user(@user_attrs.username, @user_attrs.password)
    end

    test "with a invalid user" do
      assert {:error, _} = Verify.authenticate_user(@invalid_attrs.username, @invalid_attrs.password)
    end
  end

  def create_user(_params) do
    {:ok, user} = Auth.create_user(@user_attrs)
    {:ok, user: user}
  end

end
