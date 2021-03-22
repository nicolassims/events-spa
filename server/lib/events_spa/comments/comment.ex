defmodule EventsSpa.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :user_id, :id
    field :post_id, :id

    timestamps()

    belongs_to :user, EventsSpa.Users.User
    belongs_to :event, EventsSpa.Events.Event
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :user_id, :post_id])
    |> validate_required([:body, :user_id, :post_id])
  end
end
