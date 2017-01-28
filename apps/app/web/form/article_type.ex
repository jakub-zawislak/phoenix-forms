defmodule App.ArticleType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form( form ) do

    form
    |> add(:text_input, :name, label: "Title")
    # |> add(:select, :name, label: "Title", options: ["asd": 324, "ert": 546])
    |> add(:textarea, :content, label: "Content", phoenix_opts: [
      rows: 4
    ])
    |> add(:checkbox, :visible, label: "Is hidden", required: false)
    |> add(SelectAssoc, :category_id, label: "Category", phoenix_opts: [
      prompt: "Choose category"
    ])

  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
