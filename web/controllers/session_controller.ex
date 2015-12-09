defmodule TokailyPhoenix.SessionController do
  use TokailyPhoenix.Web, :controller

  alias TokailyPhoenix.Session

  plug :scrub_params, "session" when action in [:create]

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case TokailyPhoenix.Session.login(session_params, TokailyPhoenix.Repo) do
      { :ok, user } ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "ログインしました")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:error, "メールアドレスかパスワードが間違っています")
        |> render("new.html")
    end
  end

  @doc """
  Logout

  delete_sessionでセッション情報を削除し、ホーム("/")にリダイレクトする
  """
  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "ログアウトしました")
    |> redirect(to: "/")
  end
end
