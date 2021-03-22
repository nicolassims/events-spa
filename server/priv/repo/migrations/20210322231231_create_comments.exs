defmodule EventsSpa.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string, null:false
      add :user_id, references(:users, on_delete: :nothing), null:false
      add :event_id, references(:events, on_delete: :nothing), null:false
      #TODO: what does on_delete mean?
      timestamps()
    end

    create index(:comments, [:user_id, :event_id])
  end
end
