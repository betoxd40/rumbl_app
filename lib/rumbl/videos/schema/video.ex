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
    field :slug, :string
    belongs_to :user, User
    belongs_to :category, Category

    timestamps()
  end

  def changeset(video, attrs \\ %{}) do
    video
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> slugify_title()
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      changeset
      |> put_change(:slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end

  defimpl Phoenix.Param, for: Rumbl.Video do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end
end
