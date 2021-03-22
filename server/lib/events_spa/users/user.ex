defmodule EventsSpa.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :photo_hash, :string

    timestamps()

    has_many :events, EventsSpa.Events.Event
    has_many :comments, EventsSpa.Comments.Comment
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password_hash, :email, :photo_hash])
    |> validate_required([:name, :password_hash, :email, :photo_hash])
  end
end
