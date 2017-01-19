defmodule App.Repo.Migrations.ArticleContent do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :visible, :boolean
    end
  end
end
