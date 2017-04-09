defmodule App.RegistrationInfoType do
  use Formex.Type

  def build_form( form ) do
    form
    |> add(:section, :text_input, label: "Sekcja")
  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
