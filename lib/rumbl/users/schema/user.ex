defmodule Rumbl.Users.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rumbl.Videos.Schema.Video

  @required_fields ~w(name username password)a

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :videos, Video

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, @required_fields)
    |> validate_length(:username, min: 1, max: 20)
    |> unique_constraint(:username)
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{} = changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        changeset
        |> put_change(:password_hash, Bcrypt.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end
end
