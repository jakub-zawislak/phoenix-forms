defmodule App.ArticleType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Title")
    |> add(:content, :textarea, label: "Content")
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

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
