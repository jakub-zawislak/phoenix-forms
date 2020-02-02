defmodule App.ArticleType do
  use Formex.Type
  use Formex.Ecto.Type
  alias Formex.Ecto.CustomField.SelectAssoc
  import Ecto.Changeset, only: [cast: 3]
  use Arc.Ecto.Schema

  def build_form(form) do
    form
    |> add(:title, :hidden_input, label: "Title", validation: [presence: :true, length: [in: 10..150]], struct_name: :name)
    |> add(:content, :textarea, label: "Content", validation: [presence: :true])
    |> add(:image, :file_input, label: "Image")
    # |> add(:user_id, SelectAssoc, label: "Author", choice_label: :first_name, phoenix_opts: [
    #   prompt: "Choose an author"
    # ])
    # |> add(:category_id, SelectAssoc, label: "Category", phoenix_opts: [
    #   prompt: "Choose a category"
    # ])
    # |> add(:category_id, SelectAssoc, label: "Category", without_choices: true, phoenix_opts: [
    #   class: "select",
    #   data: [
    #     live_search: true,
    #     abs_ajax_url: App.Router.Helpers.article_path(App.Endpoint, :select_categories),
    #     abs_ajax_type: "GET",
    #     abs_ajax_data_type: "json",
    #   ]
    # ])
    # |> add(:category_id, :select, label: "Category", phoenix_opts: [
    #   class: "select",
    #   data: [
    #     live_search: true,
    #     abs_ajax_url: App.Router.Helpers.article_path(App.Endpoint, :select_categories),
    #     abs_ajax_type: "GET",
    #     abs_ajax_data_type: "json",
    #   ]
    # ], without_choices: true)
    # |> add(:tags, SelectAssoc, label: "Tags")
    # |> add(:tags, SelectAssoc, label: "Tags", without_choices: true, phoenix_opts: [
    #   class: "select",
    #   data: [
    #     live_search: true,
    #     abs_ajax_url: App.Router.Helpers.article_path(App.Endpoint, :select_tags),
    #     abs_ajax_type: "GET",
    #     abs_ajax_data_type: "json",
    #   ]
    # ])
    # |> add(:visible, :checkbox, label: "Is hidden?", required: false)
    # |> add_button(:submit, if(form.struct.id, do: "Edit", else: "Add"), phoenix_opts: [
    #   class: "btn-primary"
    # ])
    |> add(:comments, App.CommentType)
    |> add(:save, :submit, label: "Zapisz", phoenix_opts: [
      class: "btn-primary"
    ])
  end

  def modify_changeset(changeset, _form) do
    changeset
    # |> Ecto.Changeset.add_error(:title, "twoja stara")
    # |> Ecto.Changeset.add_error(:title, "pierze w rzece")
    |> cast_attachments(changeset.params, [:image])
  end

  def fields_casted_manually(_form) do
    [:image]
  end

  # def translate_error do
  #   fn {msg, _opts} -> "yy"<>msg end
  # end

end
