defmodule App.RegistrationType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Name",
      validation: [presence: :true])
    |> add(:email, :text_input, label: "E-mail",
      validation: [presence: :true, length: [min: 2]])
    # |> add(:password, :password_input, label: "Hasło",
    #   validation: [presence: :true])
    |> add(:info, App.RegistrationInfoType, struct_module: App.Registration.Info)
    |> add(:addresses, App.RegistrationAddressType, struct_module: App.Registration.Address)
    |> add(:save, :submit, label: "Register", phoenix_opts: [
      class: "btn-primary"
    ])
  end

  def validate_whole_struct?, do: true
end
