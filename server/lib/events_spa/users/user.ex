defmodule EventsSpa.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()

    has_many :events, EventsSpa.Events.Event
    has_many :comments, EventsSpa.Comments.Comment
    has_many :responses, EventsSpa.Responses.Response
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password_hash, :email])
    |> add_password_hash(attrs["password"])
    |> validate_required([:name, :password_hash, :email])
  end

  def add_password_hash(cset, nil) do
    cset
  end

  def add_password_hash(cset, password) do
    change(cset, Argon2.add_hash(password))
  end
end
