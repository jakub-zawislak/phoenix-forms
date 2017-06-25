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

end