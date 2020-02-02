defmodule App.Comment do
  use App.Web, :model

  schema "abstract table: comments" do
    field :content, :string
    field :assoc_id, :integer

    timestamps()
    formex_collection_child()
  end

end
