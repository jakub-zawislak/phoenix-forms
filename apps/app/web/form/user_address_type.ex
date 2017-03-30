defmodule App.UserAddressType do
  use Formex.Type

  def build_form(form) do
    form
    |> add(:street, :text_input, label: "Ulica")
    # |> add(:postal_code, :text_input, label: "Kod pocztowy")
    |> add(:city, :text_input, label: "Miasto")
  end
end
