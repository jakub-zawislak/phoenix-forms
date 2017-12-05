defmodule App.Country do
  use App.Web, :model

  schema "countries" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def by_name(query, name) do
    name = "%#{name}%"

    from e in query,
      where: like(e.name, ^name)
  end
end
