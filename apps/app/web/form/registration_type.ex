defmodule App.RegistrationType do
  use Formex.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Name")
    |> add(:email, :text_input, label: "E-mail")
    |> add(:password, :password_input, label: "Hasło")
    |> add(:info, App.RegistrationInfoType)
    |> add(:addresses, App.RegistrationAddressType)
    |> add(:save, :submit, label: "Register", phoenix_opts: [
      class: "btn-primary"
    ])
  end
end
