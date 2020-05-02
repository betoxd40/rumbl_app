defmodule Rumbl.Categories do
  @moduledoc """
  The Categories context.
  """

  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Categories.Schema.Category

  def list_categories do
    Category
    |> order_by_name()
    |> select_name_and_ids()
    |> Repo.all()
  end

  def get_category!(id), do: Repo.get!(Category, id)

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  defp order_by_name(query), do: from(c in query, order_by: c.name)
  defp select_name_and_ids(query), do: from(c in query, select: {c.name, c.id})
end
