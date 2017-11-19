defmodule App.UserAddressTag do
  use App.Web, :model

  schema "user_address_tags" do
    field :name, :string

    belongs_to :user_address, App.UserAddress

    timestamps()
    formex_collection_child()
  end

  # @doc """
  # Builds a changeset based on the `struct` and `params`.
  # """
  # def changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:street, :postal_code, :city])
  #   |> validate_required([:street, :postal_code, :city])
  # end
end
