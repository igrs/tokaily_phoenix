defmodule TokailyPhoenix.UserTest do
  use TokailyPhoenix.ModelCase

  alias TokailyPhoenix.User

  @valid_attrs %{
    email: "specialweekisno1@gmail.com",
    password: "testpassword",
    password_confirmation: "testpassword"
  }
  @invalid_attrs %{
    email: "specialweekisno1@gmail.com",
    password: "testpassword",
    password_confirmation: "password"
  }

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
