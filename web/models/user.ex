defmodule TokailyPhoenix.User do
  use TokailyPhoenix.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :name, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w(name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 10)
    |> validate_confirmation(:password)
  end

  @doc """
  Creates a users record.

  Convert inputed password to hashed password with put_change.
  """
  def create(changeset, repo) do
    changeset
    |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  @doc """
  Convert password to crypted password.

  Use Bcrypt module.
  """
  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
