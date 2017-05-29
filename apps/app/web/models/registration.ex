defmodule App.Registration.Info do
  defstruct [:section, :cost_group]
end

defmodule App.Registration.Address do
  defstruct [:id, :street, :city, :formex_id, :formex_delete]
end

defmodule App.Registration do
  # use App.Web, :model

  defstruct [{:name, "domyślne imię"}, :email, :password, addresses: [], info: %App.Registration.Info{}]
  
  use Vex.Struct

  validates :email, format: ~r/^.*?@.*?$/

  # embedded_schema do
  #   field :name
  #   field :email
  #   field :password

  #   # embeds_one :info, Info do
  #   #   field :section
  #   # end
  #   #
  #   # embeds_many :addresses, Address do
  #   #   field :street
  #   #   field :city
  #   #   formex_collection_child()
  #   # end

  # end

end