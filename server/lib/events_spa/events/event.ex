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
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:body, :name, :guests, :date])
    |> validate_required([:body, :name, :guests, :date])
  end
end
