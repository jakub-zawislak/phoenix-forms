defmodule App.Repo.Migrations.UserAddressTag do
  use Ecto.Migration

  def change do
    create table(:user_address_tags) do
      add :name, :string
      add :user_address_id, references(:user_addresses, on_delete: :nothing)

      timestamps()
    end

    create index(:user_address_tags, [:user_address_id])
  end
end
