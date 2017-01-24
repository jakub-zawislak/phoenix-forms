defmodule App.CategoryType do
  use Formex.Form

  def build_form( form ) do

    form
    |> add(:text_input, :name, [ label: "Nazwa" ])

  end
end
