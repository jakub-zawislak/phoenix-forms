defmodule App.UserAddress do
  use App.Web, :model

  schema "user_addresses" do
    field :street, :string
    field :postal_code, :string
    field :city, :string

    belongs_to :user, App.User

    timestamps()
    formex_collection_child()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:street, :postal_code, :city])
    |> validate_required([:street, :postal_code, :city])
  end
end
