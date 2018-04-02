defmodule App.Repo.Migrations.UserAddressImage do
  use Ecto.Migration

  def change do
    alter table(:user_addresses) do
      add :image, :string
    end
  end
end
