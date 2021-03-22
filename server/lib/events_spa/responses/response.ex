defmodule EventsSpa.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :value, :integer
    belongs_to :user, EventsSpa.Users.User
    belongs_to :event, EventsSpa.Events.Event

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:value, :user_id, :event_id])
    |> validate_required([:value, :user_id, :event_id])
  end
end
