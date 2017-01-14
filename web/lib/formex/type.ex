defmodule Formex.Type do
  import Ecto
  import Ecto.Query

  @repo Application.get_env(:formex, :repo)

  def put_field(form, :entity, name, options) do

    get_options = fn ->
      module = form.model.__schema__(:association, name).queryable

      query = from e in module,
        select: {e.name, e.id},
        order_by: e.name

      @repo.all(query)
    end

    field = %{
      type: :entity,
      value: Map.get(form.struct, name),
      options: get_options.()
    }

    put_field(form, field)
  end

  def put_field(form, type, name, _options) do
    field = %{
      type: type,
      value: Map.get(form.struct, name)
    }

    put_field(form, field)
  end

  #

  defp put_field(form, field) do
    fields = form.fields ++ [field]

    Map.put(form, :fields, fields)
  end

end
