defmodule App.RegistrationAddressType do
  use Formex.Type

  def build_form( form ) do
    form
    |> add(:street, :text_input, label: "Ulica", validation: [presence: :true])
    |> add(:city, :text_input, label: "Miasto", validation: [presence: :true])
  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
