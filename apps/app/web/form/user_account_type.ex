defmodule App.UserAccountType do
  use Formex.Type

  def build_form(form) do
    form
    |> add(:number, :text_input, label: "Numer")
  end
end
