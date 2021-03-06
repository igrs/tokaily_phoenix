defmodule TokailyPhoenix.Category do
  use TokailyPhoenix.Web, :model

  schema "categories" do
    field :name, :string

    timestamps

    has_many :articles, TokailyPhoenix.Article
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:password, max: 50)
  end
end
