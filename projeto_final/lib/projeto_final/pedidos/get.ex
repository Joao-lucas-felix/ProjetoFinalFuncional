defmodule ProjetoFinal.Pedidos.Get do
  alias ProjetoFinal.Pedidos.Pedido
  alias ProjetoFinal.Repo
  def call(id) do
    case Repo.get(Pedido, id ) do
      nil -> {:error, :not_found}
      pedido -> {:ok, pedido}
    end
  end
end
