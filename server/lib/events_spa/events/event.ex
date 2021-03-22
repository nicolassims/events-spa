defmodule EventsSpa.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :body, :string
    field :date, :naive_datetime
    field :guests, :string
    field :name, :string
    field :user_id, :id

    timestamps()

    belongs_to :user, EventsSpa.Users.User
    has_many :comments, EventsSpa.Comments.Comment
    has_many :responses, EventsSpa.Responses.Response
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:body, :name, :guests, :date, :user_id])
    |> validate_required([:body, :name, :guests, :date, :user_id])
  end
end
