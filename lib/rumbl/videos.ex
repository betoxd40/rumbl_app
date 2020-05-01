defmodule Rumbl.Videos do
  @moduledoc """
  The Videos context.
  """

  import Ecto
  import Ecto.Query, warn: false

  alias Rumbl.Repo
  alias Rumbl.Videos.Schema.Video

  def list_videos do
    Repo.all(Video)
  end

  def get_video!(id), do: Repo.get!(Video, id)

  def create_video(user, attrs \\ %{}) do
    change_video_user(user, attrs)
    |> Repo.insert()
  end

  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  def change_video(%Video{} = video, attrs \\ %{}) do
    Video.changeset(video, attrs)
  end

  def change_video_user(user, attrs \\ %{}) do
    user
    |> build_assoc(:videos)
    |> Video.changeset(attrs)
  end
end
