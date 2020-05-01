defmodule Rumbl.Users do
  import Ecto
  import Ecto.Query

  alias Rumbl.Users.Schema.User
  alias Rumbl.Repo

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

  def get_videos(user) do
    user
    |> assoc(:videos)
    |> Repo.all()
  end

  def get_video_by_id(user, video_id) do
    user
    |> assoc(:videos)
    |> Repo.get!(video_id)
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
