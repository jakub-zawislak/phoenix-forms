defmodule App.UserSchoolType do
  use Formex.Type
  use Formex.Ecto.Type
  alias Formex.Ecto.CustomField.SelectAssoc

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Nazwa", validation: [presence: :true])
    |> add(:department_id, SelectAssoc, label: "Dział", phoenix_opts: [
      prompt: "Wybierz dział"
    ])
  end
end
