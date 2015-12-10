defmodule TokailyPhoenix.SessionControllerTest do
  use TokailyPhoenix.ConnCase

  @valid_attrs %{ email: "specialweekisno1@gmail.com", password: "testpassword" }
  @invalid_attrs %{ email: "", password: "testpassword" }

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, session_path(conn, :new)
    assert html_response(conn, 200) =~ "ログイン"
  end
end
