defmodule App.UserType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form( form ) do

    form
    |> add(:first_name, :text_input, label: "Imię")
    |> add(:last_name, :text_input, label: "Nazwisko")
    # |> add(:department_id, SelectAssoc, label: "Dział", phoenix_opts: [
    #   prompt: "Wybierz dział"
    # ])
    # |> add(:user_info, App.UserInfoType)
    |> add(:user_addresses, App.UserAddressType)
    |> add(:schools, App.UserSchoolType)

  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
