defmodule App.ArticleType do
  import Formex.Type

  def build_form( form ) do

    form
    |> put_field(:text_input, :name, label: "Tytuł")
    |> put_field(:textarea, :content, label: "Treść", phoenix_opts: [
      rows: 4
    ])
    |> put_field(:checkbox, :hidden, label: "Ukryty", required: false)
    |> put_field(:select_assoc, :category_id, label: "Kategoria", phoenix_opts: [
      prompt: "Wybierz kategorię"
    ])

  end
end
