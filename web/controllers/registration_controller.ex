defmodule TokailyPhoenix.RegistrationController do
  use TokailyPhoenix.Web, :controller
  alias TokailyPhoenix.User

  def new(conn, _params) do
    conn
    |> assign(:changeset, User.changeset(%User{}))
    |> render("new.html")
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case User.create(changeset, TokailyPhoenix.Repo) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "ようこそ" <> changeset.params["email"])
        |> redirect(to: "/")
      { :error, changeset } ->
        conn
        |> put_flash(:info, "アカウントを作成できませんでした")
        |> render("new.html", changeset: changeset)
    end
  end
end
