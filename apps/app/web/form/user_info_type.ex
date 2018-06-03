defmodule App.UserInfoType do
  use Formex.Type
  use Formex.Ecto.Type
  alias Formex.Ecto.CustomField.SelectAssoc

  def build_form( form ) do

    form
    |> add(:section, :text_input, label: "Sekcja", validation: [presence: :true])
    |> add(:organisation_cell, :text_input, label: "Komórka organizacyjna", validation: [presence: :true])
    |> add(:organisation_unit, :text_input, label: "Jednostka organizacyjna", validation: [presence: :true])

  end

  def modify_changeset( changeset ) do
    changeset
  end

end
