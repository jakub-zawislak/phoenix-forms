defmodule App.Article do
  use App.Web, :model

  schema "articles" do
    field :name, :string
    field :content, :string
    field :visible, :boolean

    belongs_to :category, App.Category

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :content, :category_id])
    |> validate_required([:name, :content, :category_id])
  end

  def modify_changeset(changeset) do
    IO.inspect "asd"
    nil
  end

end
