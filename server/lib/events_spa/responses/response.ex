defmodule EventsSpa.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :value, :integer
    field :user_id, :id
    field :event_id, :id

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
