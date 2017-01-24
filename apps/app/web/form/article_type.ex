defmodule App.ArticleType do
  use Formex.Form

  def build_form( form ) do

    form
    |> add(:text_input, :name, label: "Title")
    |> add(:textarea, :content, label: "Content", phoenix_opts: [
      rows: 4
    ])
    |> add(:checkbox, :visible, label: "Is hidden", required: false)
    |> add(:select_assoc, :category_id, label: "Category", phoenix_opts: [
      prompt: "Choose category"
    ])

  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
