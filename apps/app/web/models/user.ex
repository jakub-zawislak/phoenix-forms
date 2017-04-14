defmodule App.User do
  use App.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string

    belongs_to :department, App.Department
    belongs_to :user_info, App.UserInfo
    has_many   :user_addresses, App.UserAddress
    has_many   :user_accounts, App.UserAccount

    # embeds_many :schools, School do
    #   field :name, :string
    #   formex_collection_child()
    # end

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
    |> cast_assoc(:user_info)
    |> cast_assoc(:user_addresses)
  end
end
