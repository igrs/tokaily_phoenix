defmodule TokailyPhoenix.Repo.Migrations.InitialSchema do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email,            :string, null: false
      add :crypted_password, :string, null: false
      add :name,             :string, null: true

      timestamps
    end

    create unique_index(:users, [:email])
  end
end
