defmodule TokailyPhoenix.Article do
  use TokailyPhoenix.Web, :model

  schema "articles" do
    field :title, :string
    field :body,  :string

    timestamps

    belongs_to :category, TokailyPhoenix.Category
  end

  @required_fields ~w(body category_id)
  @optional_fields ~w(title)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
