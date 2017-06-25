defmodule App.UserAddressType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:street, :text_input, label: "Ulica", validation: [presence: :true])
    # |> add(:postal_code, :text_input, label: "Kod pocztowy", validation: [presence: :true])
    |> add(:city, :text_input, label: "Miasto", validation: [presence: :true])
  end
end
