defmodule App.UserAddressTagType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Nazwa", validation: [presence: :true])
  end
end
