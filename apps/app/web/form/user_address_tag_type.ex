defmodule App.UserAddressTagType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Nazwa", validation: [presence: :true])
  end

  # def modify_changeset(changeset, _form) do
  #   changeset
  #   |> Ecto.Changeset.add_error(:name, "ss tag")
  # end
end
