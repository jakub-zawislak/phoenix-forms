defmodule App.Repo.Migrations.UserDegrees do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :degrees, {:array, :string}
    end
    execute "UPDATE users SET degrees = '{}'"
  end
end
