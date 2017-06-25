defmodule App.RegistrationInfoType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:section, :text_input, label: "Sekcja", validation: [presence: :true])
  end

  # jak nie ma walidacji to się wywala

end
