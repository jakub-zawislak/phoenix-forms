defmodule App.UserAddressType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:ulica, :text_input, label: "Ulica", validation: [presence: :true], struct_name: :street)
    # |> add(:postal_code, :text_input, label: "Kod pocztowy", validation: [presence: :true])
    |> add(:city, :text_input, label: "Miasto", validation: [presence: :true])
    |> add(:user_address_tags, App.UserAddressTagType)
  end
end
