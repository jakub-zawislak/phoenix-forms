defmodule App.ArticleType do
  use Formex.Type
  use Formex.Ecto.Type
  alias Formex.Ecto.CustomField.SelectAssoc

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Title", validation: [presence: :true, length: [in: 10..150]])
    |> add(:content, :textarea, label: "Content", validation: [presence: :true])
    # |> add(:user_id, SelectAssoc, label: "Author", choice_label: :first_name, phoenix_opts: [
    #   prompt: "Choose an author"
    # ])
    |> add(:category_id, SelectAssoc, label: "Category", phoenix_opts: [
      prompt: "Choose a category"
    ])
    |> add(:tags, SelectAssoc, label: "Tags")
    |> add(:visible, :checkbox, label: "Is hidden?", required: false)
    # |> add_button(:submit, if(form.struct.id, do: "Edit", else: "Add"), phoenix_opts: [
    #   class: "btn-primary"
    # ])
    |> add(:save, :submit, label: "Zapisz", phoenix_opts: [
      class: "btn-primary"
    ])
  end

end
