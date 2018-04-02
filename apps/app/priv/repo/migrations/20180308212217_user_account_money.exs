defmodule App.Repo.Migrations.UserAccountMoney do
  use Ecto.Migration

  def change do
    alter table(:user_accounts) do
      add :money, :integer
    end
  end
end
