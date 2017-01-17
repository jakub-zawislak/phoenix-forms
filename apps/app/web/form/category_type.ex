defmodule App.CategoryType do
  import Formex.Type

  def build_form( form ) do

    form
    |> put_field(:text_input, :name, [ label: "Nazwa" ])

  end
end
