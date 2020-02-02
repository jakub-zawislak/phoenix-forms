defmodule App.Repo.Migrations.Comments do
  use Ecto.Migration

  def change do
    create table(:article_comments) do
      add :content, :string
      add :assoc_id, references(:articles)

      timestamps()
    end

    create index(:article_comments, [:assoc_id])
  end
end
