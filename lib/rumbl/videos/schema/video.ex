defmodule Rumbl.Videos.Schema.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rumbl.Users.Schema.User

  @required_fields ~w(url title description)a

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  def changeset(video, attrs \\ %{}) do
    video
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
