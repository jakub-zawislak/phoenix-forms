defmodule App.ArticleWithoutEctoType do
  use Formex.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Title", validation: [presence: true], struct_name: :title)
    |> add(:content, :textarea, label: "Content", validation: [presence: true], phoenix_opts: [
      rows: 4
    ])
    |> add(:hidden, :checkbox, label: "Is hidden?", required: false)
    |> add(:save, :submit, label: "Submit", phoenix_opts: [
      class: "btn-primary"
    ])
  end

end
