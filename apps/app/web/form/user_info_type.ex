defmodule App.UserInfoType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form( form ) do

    form
    |> add(:section, :text_input, label: "Sekcja")
    |> add(:organisation_cell, :text_input, label: "Komórka organizacyjna")
    |> add(:organisation_unit, :text_input, label: "Jednostka organizacyjna")

  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
