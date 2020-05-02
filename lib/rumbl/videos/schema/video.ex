defmodule Rumbl.Videos.Schema.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rumbl.Users.Schema.User
  alias Rumbl.Categories.Schema.Category

  @required_fields ~w(url title description)a
  @optional_fields ~w(category_id)a

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, User
    belongs_to :category, Category

    timestamps()
  end

  def changeset(video, attrs \\ %{}) do
    video
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:category)
  end
end
