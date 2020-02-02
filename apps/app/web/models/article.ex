defmodule App.Article do
  use App.Web, :model

  schema "articles" do
    field :name, :string
    field :content, :string
    field :visible, :boolean
    field :image, App.Article.Image.Type

    belongs_to :category, App.Category
    belongs_to :user, App.User

    has_many :comments, {"article_comments", App.Comment}, foreign_key: :assoc_id

    many_to_many :tags, App.Tag, join_through: "articles_tags",
      on_delete: :delete_all, on_replace: :delete

    timestamps()
  end

end
