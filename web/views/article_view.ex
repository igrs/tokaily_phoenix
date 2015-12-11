defmodule TokailyPhoenix.ArticleView do
  use TokailyPhoenix.Web, :view

  def render("scripts.new.html", _assigns) do
    "<script src=\"//cdn.jsdelivr.net/medium-editor/latest/js/medium-editor.min.js\"></script>"
  end

  def render("stylesheets.new.html", _assigns) do
    "<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/medium-editor/latest/css/medium-editor.min.css\" type=\"text/css\" media=\"screen\" charset=\"utf-8\">"
  end

  def render("scripts.edit.html", _assigns) do
    "<script src=\"//cdn.jsdelivr.net/medium-editor/latest/js/medium-editor.min.js\"></script>"
  end

  def render("stylesheets.edit.html", _assigns) do
    "<link rel=\"stylesheet\" href=\"//cdn.jsdelivr.net/medium-editor/latest/css/medium-editor.min.css\" type=\"text/css\" media=\"screen\" charset=\"utf-8\">"
  end
end
