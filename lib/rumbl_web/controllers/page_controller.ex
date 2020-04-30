defmodule RumblWeb.PageController do
  use RumblWeb, :controller
  alias Rumbl.Users
  alias Rumbl.Users.Schema.User

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
