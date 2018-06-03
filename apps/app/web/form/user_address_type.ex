defmodule App.UserAddressType do
  use Formex.Type
  use Formex.Ecto.Type
  alias Formex.Ecto.CustomField.SelectAssoc
  import Ecto.Changeset, only: [cast: 3]
  # use Arc.Ecto.Schema

  def build_form(form) do
    form
    |> add(:ulica, :text_input, label: "Ulica", validation: [presence: :true], struct_name: :street)
    # |> add(:postal_code, :text_input, label: "Kod pocztowy", validation: [presence: :true])
    |> add(:city, :text_input, label: "Miasto", validation: [presence: :true])
    # |> add(:city, :select, choices: [{"a", "a"}, {"b", "b"}], label: "Miasto", validation: [presence: :true])
    # |> add(:country_id, SelectAssoc, label: "Kraj", validation: [presence: :true])
    # |> add(:image, :file_input, label: "Image")
    # |> add(:country_id, SelectAssoc, label: "Kraj", without_choices: true, phoenix_opts: [
    #   class: "select",
    #   data: [
    #     live_search: true,
    #     abs_ajax_url: App.Router.Helpers.user_path(App.Endpoint, :select_countries),
    #     abs_ajax_type: "GET",
    #     abs_ajax_data_type: "json",
    #   ]
    # ], validation: [presence: :true])
    |> add(:user_address_tags, App.UserAddressTagType)
  end

  def modify_changeset(changeset, _form) do
    # if changeset.data.street == "2" do
    #   changeset
    #   |> Ecto.Changeset.add_error(:street, "ssadres")
    #   |> Ecto.Changeset.add_error(:city, "ss miasto")
    # else
    #   changeset
    # end

    changeset

    # |> cast_attachments(changeset.params, [:image])
  end

  # def fields_casted_manually(_form) do
  #   [:image]
  # end
end
