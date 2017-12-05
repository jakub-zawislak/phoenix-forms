defmodule App.Category do
  use App.Web, :model

  schema "categories" do
    field :name, :string

    timestamps()
  end

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
