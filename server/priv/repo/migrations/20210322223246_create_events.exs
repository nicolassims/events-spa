defmodule EventsSpa.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :body, :string, null: false
      add :name, :string, null: false
      add :guests, :string, null: false
      add :date, :string, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      #TODO: what does on_delete mean?
      timestamps()
    end

    create index(:events, [:user_id])
  end
end
