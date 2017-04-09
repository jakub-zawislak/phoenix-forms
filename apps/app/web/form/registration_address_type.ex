defmodule App.RegistrationAddressType do
  use Formex.Type

  def build_form( form ) do
    form
    |> add(:street, :text_input, label: "Ulica")
    |> add(:city, :text_input, label: "Miasto")
  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
