defmodule TokailyPhoenix.RegistrationController do
  use TokailyPhoenix.Web, :controller

  alias TokailyPhoenix.User

  plug :scrub_params, "registration" when action in [:create]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"registration" => registration_params}) do
    changeset = User.changeset(%User{}, registration_params)

    case Repo.insert(changeset) do
      {:ok, _registration} ->
        conn
        |> put_flash(:info, "Registration created successfully.")
        |> redirect(to: registration_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
