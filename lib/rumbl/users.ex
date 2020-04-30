defmodule Rumbl.Users do
  alias Rumbl.Users.Schema.User
  alias Rumbl.Repo
  import Ecto.Query

  def all() do
    User
    |> Repo.all()
  end

  def get(id) do
    User
    |> Repo.get(id)
  end

  def get_by_username(username) do
    Repo.one(from u in User, where: u.username == ^username)
  end

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
