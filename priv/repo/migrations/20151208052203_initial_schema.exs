defmodule TokailyPhoenix.Repo.Migrations.InitialSchema do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :email,            :string, null: false
      add :crypted_password, :string, null: false
      add :name,             :string, null: true
      timestamps
    end
    create unique_index(:users, [:email]) # Unique constraint

    create table(:categories) do
      add :name, :string, null: false
      timestamps
    end

    create table(:articles) do
      add :title,       :string, null: false
      add :body,        :text,   null: false
      add :category_id, references(:categories)
      timestamps
    end
    create index(:articles, [:category_id]) # Foreign key
    create index(:articles, [:updated_at])  # Index

    create table(:materials) do
      add :memo, :string, null: true
      add :path, :string, null: false
      timestamps
    end

  end
end
