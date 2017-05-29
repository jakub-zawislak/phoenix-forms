defmodule App.Repo.Migrations.UserMoney do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :money, :integer
    end
  end
end
