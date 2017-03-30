defmodule App.UserInfo do
  use App.Web, :model

  schema "user_infos" do
    field :section, :string
    field :organisation_cell, :string
    field :organisation_unit, :string

    has_one :user, App.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:section, :organisation_cell, :organisation_unit])
    |> validate_required([:section, :organisation_cell, :organisation_unit])
  end
end
