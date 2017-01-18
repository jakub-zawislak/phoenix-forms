defmodule App.ArticleType do
  import Formex.Type

  def build_form( form ) do

    form
    |> put_field(:text_input, :name, label: "Tytuł")
    # |> put_field(:textarea, :content, [ label: "Treść" ])
    |> put_field(:select, :category, label: "Kategoria", phoenix_opts: [
      prompt: "Wybierz kategorię"
    ])

  end
end
