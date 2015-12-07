defmodule TokailyPhoenix.PageController do
  use TokailyPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
