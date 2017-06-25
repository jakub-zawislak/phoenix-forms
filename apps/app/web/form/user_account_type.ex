defmodule App.UserAccountType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:number, :text_input, label: "Numer", validation: [presence: :true])
  end
end
