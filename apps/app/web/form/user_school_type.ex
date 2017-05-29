defmodule App.UserSchoolType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Nazwa")
    |> add(:department_id, SelectAssoc, label: "Dział", phoenix_opts: [
      prompt: "Wybierz dział"
    ])
  end
end
