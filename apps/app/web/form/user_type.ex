defmodule App.UserType do
  use Formex.Type
  use Formex.Ecto.Type
  use Formex.Ecto.ChangesetValidator
  alias Formex.Ecto.CustomField.SelectAssoc

  def build_form(form) do

    form
    # |> add(:first_name, :text_input, label: "Imię", validation: [presence: :true])
    # |> add(:last_name, :text_input, label: "Nazwisko", validation: [presence: :true])
    |> add(:first_name, :text_input, label: "Imię", validation: [:required])
    |> add(:last_name, :text_input, label: "Nazwisko", validation: [
      # required: [message: "yy yy!"],
      # format: [arg: ~r/(^[0-9])/],
      # inclusion: [arg: 0..12]
      :required
    ])
    |> add(:degrees, :multiple_select, label: "Degrees", validation: [:required], choices: [
      bachelor: "Bachelor",
      master: "Master",
      doctor: "Doctor",
      professor: "Professor",
    ])
    |> add(:money, :text_input, custom_value: fn value ->
      value && value != "" && (value.amount / 100)
      |> to_string
      |> String.slice(0..-3)
    end)
    # |> add(:department_id, SelectAssoc, label: "Dział", phoenix_opts: [
    #   prompt: "Wybierz dział"
    # ])
    # |> add(:user_info, App.UserInfoType)
    # |> add(:user_addresses, App.UserAddressType)
    # |> add(:user_accounts, App.UserAccountType, delete_field: :removed, filter: fn item ->
    #   !item.removed
    # end)
    # |> add(:schools, App.UserSchoolType)

  end

  def validator, do: Formex.Ecto.ChangesetValidator
  # def validator, do: Formex.Validator.Simple

  def changeset_validation(changeset, _form) do
    changeset
    # |> add_error(:first_name, "yy\n!!")
    # |> add_error(:first_name, "ee ee")
    # |> add_error(:last_name, "aaa")
  end

end
