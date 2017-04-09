defmodule App.Registration do
  use App.Web, :model

  embedded_schema do
    field :name
    field :email
    field :password

    embeds_one :info, Info do
      field :section
    end

    embeds_many :addresses, Address do
      field :street
      field :city
      formex_collection_child()
    end

  end

end
