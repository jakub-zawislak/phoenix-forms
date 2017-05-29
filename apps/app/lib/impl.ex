defprotocol X.BuilderProtocol do
  def run(data)
end

defimpl X.BuilderProtocol, for: X.Ecto.Builder do
  def run(data), do: 42
end

defmodule X.Builder do
  def create(data) do
    wrapper = data.__struct__.wrapper
    data_wrapped = struct(wrapper, data: data)
    
    X.BuilderProtocol.run data_wrapped
  end
end

# 

defmodule X.Ecto.Builder do
  defstruct data: nil
end

defmodule X.Classic.Builder do
  defstruct data: nil
end

# 

defmodule Y.User do
  defstruct name: nil

  def wrapper, do: X.Ecto.Builder
end
