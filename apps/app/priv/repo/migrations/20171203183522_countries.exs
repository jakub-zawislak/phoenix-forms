defmodule App.Repo.Migrations.Countries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string

      timestamps()
    end

    alter table(:user_addresses) do
      add :country_id, references(:countries)
    end

    create index(:user_addresses, [:country_id])
  end
end
