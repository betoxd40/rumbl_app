defmodule RumblWeb.PageView do
  use RumblWeb, :view

  def render("index.html", _assigns) do
    ~E"""
      Hello World
    """
  end
end
