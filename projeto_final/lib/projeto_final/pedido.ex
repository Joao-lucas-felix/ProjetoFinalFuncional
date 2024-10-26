defmodule ProjetoFinal.Pedidos do
  alias ProjetoFinal.Pedidos.Get
  alias ProjetoFinal.Pedidos.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
