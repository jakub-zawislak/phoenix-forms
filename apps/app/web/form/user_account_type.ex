defmodule App.UserAccountType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:number, :text_input, label: "Numer", validation: [presence: :true])
    # |> add(:money, :text_input, custom_value: fn value -> value && value.amount end)
  end
end
