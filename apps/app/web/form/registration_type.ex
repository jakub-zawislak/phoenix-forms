defmodule App.RegistrationType do
  use Formex.Type
  alias Formex.CustomField.SelectAssoc

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Name")
    |> add(:email, :textarea, label: "E-mail")
    |> add(:password, SelectAssoc, label: "Password")
    |> add(:save, :submit, label: "Register", phoenix_opts: [
      class: "btn-primary"
    ])
  end

  def changeset_after_create_callback( changeset ) do
    changeset
  end

end
