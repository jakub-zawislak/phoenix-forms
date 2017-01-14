defmodule Formex.Builder do

  def create_form(type, struct) do
    %{
      type: type,
      struct: struct,
      model: struct.__struct__,
      fields: [],
      params: %{},
      changeset: nil
    }
  end

  def handle_request(form, params) do
    form
    |> Map.put(:params, params)
    |> form.type.build_form()
    |> create_changeset()
    |> IO.inspect
  end

  defp create_changeset(form) do

    IO.inspect "--"

    form
  end

end
