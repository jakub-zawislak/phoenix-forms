defmodule App.UserAccount do
  use App.Web, :model

  schema "user_accounts" do
    field :number, :string
    field :removed, :boolean

    belongs_to :user, App.User

    timestamps()
    formex_collection_child()
  end

end
