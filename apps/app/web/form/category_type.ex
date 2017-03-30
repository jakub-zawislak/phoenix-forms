defmodule App.CategoryType do
  use Formex.Type

  def build_form( form ) do

    form
    |> add(:name, :text_input, [ label: "Nazwa" ])

  end
end
