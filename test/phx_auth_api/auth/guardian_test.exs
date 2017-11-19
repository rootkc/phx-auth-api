defmodule PhxAuthApi.GuardianTest do
  use PhxAuthApi.DataCase

  alias PhxAuthApi.Auth
  alias PhxAuthApi.Auth.Guardian

  @user_attrs %{username: "some username", password: "some password"}

  describe("subject_for_token") do
    setup :create_user

    test "subject_for_token/2 with valid data returns user.id", %{user: user} do
      assert Guardian.subject_for_token(%{id: user.id}, nil) == {:ok, "#{user.id}"}
    end
  end

  describe("resource_from_claims") do
    setup :create_user

    test "resource_from_claims/1 with valid data returns user data", %{user: user} do
      assert Guardian.resource_from_claims(%{"sub" => user.id }) == {:ok, user}
    end

    test "resource_from_claims/1 with invalid data returns error" do
      assert Guardian.resource_from_claims(%{"what" => "what what"}) == {:error, :invalid_claims}
    end
  end

  def create_user(_params) do
    {:ok, user} = Auth.create_user(@user_attrs)
    {:ok, user: user}
  end

end
