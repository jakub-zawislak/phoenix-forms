defmodule App.ArticleForm do
  use Formex.Form

  def build_form( form ) do

    form
    |> add(:text_input, :name, label: "Tytuł")
    |> add(:textarea, :content, label: "Treść", phoenix_opts: [
      rows: 4
    ])
    |> add(:checkbox, :visible, label: "Ukryty", required: false)
    |> add(:select_assoc, :category_id, label: "Kategoria", phoenix_opts: [
      prompt: "Wybierz kategorię"
    ])

  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
