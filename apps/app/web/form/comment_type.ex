defmodule App.CommentType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:content, :text_input, label: "Treść komentarza", validation: [presence: :true])
  end

end
