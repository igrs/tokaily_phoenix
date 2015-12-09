defmodule TokailyPhoenix.RegistrationControllerTest do
  use TokailyPhoenix.ConnCase

  alias TokailyPhoenix.User
  @valid_attrs %{
    email: "specialweekisno1@gmail.com",
    password: "testpassword",
    password_confirmation: "testpassword"
  }
  @invalid_attrs %{
    email: "specialweekisno1@gmail.com",
    password: "testpassword",
    password_confirmation: "password"
  }

  setup do
    conn = conn()
    { :ok, conn: conn }
  end

  test "renders form for new resources", %{ conn: conn } do
    conn = get conn, registration_path(conn, :new)
    assert html_response(conn, 200) =~ "ユーザー新規登録"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), user: @valid_attrs
    assert redirected_to(conn) == page_path(conn, :index)
    assert Repo.get_by(User, email: @valid_attrs[:email])
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200) =~ "ユーザー新規登録"
  end
end
