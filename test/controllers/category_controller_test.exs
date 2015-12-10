defmodule TokailyPhoenix.CategoryControllerTest do
  use TokailyPhoenix.ConnCase

  alias TokailyPhoenix.Category
  @valid_attrs %{ name: "テストカテゴリ" }
  @invalid_attrs %{ name: "" }

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, category_path(conn, :index)
    assert html_response(conn, 200) =~ "カテゴリ一覧"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, category_path(conn, :new)
    assert html_response(conn, 200) =~ "カテゴリ新規作成"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, category_path(conn, :create), category: @valid_attrs
    assert redirected_to(conn) == category_path(conn, :index)
    assert Repo.get_by(Category, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, category_path(conn, :create), category: @invalid_attrs
    assert html_response(conn, 200) =~ "カテゴリ新規作成"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    category = Repo.insert! %Category{ name: "カテゴリテスト" }
    conn = get conn, category_path(conn, :edit, category)
    assert html_response(conn, 200) =~ "カテゴリ編集"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    category = Repo.insert! %Category{ name: "カテゴリテスト" }
    conn = put conn, category_path(conn, :update, category), category: @valid_attrs
    assert redirected_to(conn) == category_path(conn, :index)
    assert Repo.get_by(Category, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    category = Repo.insert! %Category{ name: "カテゴリテスト" }
    conn = put conn, category_path(conn, :update, category), category: @invalid_attrs
    assert html_response(conn, 200) =~ "カテゴリ編集"
  end

  test "deletes chosen resource", %{conn: conn} do
    category = Repo.insert! %Category{ name: "カテゴリテスト" }
    conn = delete conn, category_path(conn, :delete, category)
    assert redirected_to(conn) == category_path(conn, :index)
    refute Repo.get(Category, category.id)
  end
end
