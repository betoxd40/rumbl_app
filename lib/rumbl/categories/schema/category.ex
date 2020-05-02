defmodule Rumbl.Categories.Schema.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rumbl.Videos.Schema.Video

  @required_fields ~w(name)a

  schema "categories" do
    field :name, :string
    has_many :videos, Video

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
