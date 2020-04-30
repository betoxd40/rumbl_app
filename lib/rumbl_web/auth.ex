defmodule RumblWeb.Auth do
  import Plug.Conn
  alias Rumbl.Users
  import Bcrypt, only: [verify_pass: 2]

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Users.get(user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def login_by_username_and_pass(conn, username, password) do
    user = Users.get_by_username(username)

    cond do
      user && verify_pass(password, user.password_hash) ->
        {:ok, login(conn, user)}

      user ->
        {:error, :unauthorized, conn}

      true ->
        {:error, :not_found, conn}
    end
  end
end
