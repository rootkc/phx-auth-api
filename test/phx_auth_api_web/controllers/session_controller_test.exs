defmodule PhxAuthApiWeb.SessionControllerTest do
  use PhxAuthApiWeb.ConnCase

  alias PhxAuthApi.Auth
  
  @create_attrs %{password: "some password", username: "some username"}

  def fixture(:user) do
    {:ok, user} = Auth.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "login" do
    setup [:create_user]

    test "renders token when user is valid", %{conn: conn} do
      conn = post conn, session_path(conn, :login), user: @create_attrs
      assert Map.has_key?(json_response(conn, 201)["data"], "token")
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
