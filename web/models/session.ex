defmodule TokailyPhoenix.Session do

  alias TokailyPhoenix.User

  @doc """
  Login user

  If success authentication return {:ok, user} else :error.
  """
  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> { :ok, user }
      _    -> :error
    end
  end

  @doc """
  Authenticate user

  Compare input password and db password
  """
  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end

  @doc """
  Get Current User

  Return current user if user id exists in session
  """
  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: TokailyPhoenix.Repo.get(User, id)
  end


  @doc """
  Do current user logged in?
  """
  def logged_in?(conn) do
    !!current_user(conn)
  end
end
