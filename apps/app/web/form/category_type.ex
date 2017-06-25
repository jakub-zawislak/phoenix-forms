defmodule App.CategoryType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form( form ) do

    form
    |> add(:name, :text_input, [ label: "Nazwa" ])

  end
end
