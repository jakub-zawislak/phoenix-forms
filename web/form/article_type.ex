defmodule App.ArticleType do
  import Formex.Type

  def build_form( form ) do

    form
    |> put_field(:text, :name, [ required: true, label: "Nazwa" ])
    |> put_field(:entity, :category, [ required: true, label: "Kategoria" ])

  end
end
