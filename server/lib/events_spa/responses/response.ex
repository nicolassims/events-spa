defmodule EventsSpa.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :value, :integer
    field :user_id, :id
    field :event_id, :id

    timestamps()

    belongs_to :user, EventsSpa.Users.User
    belongs_to :event, EventsSpa.Events.Event
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:value, :user_id, :event_id])
    |> validate_required([:value, :user_id, :event_id])
  end
end
