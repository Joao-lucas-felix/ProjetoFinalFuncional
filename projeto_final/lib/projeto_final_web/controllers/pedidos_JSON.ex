defmodule ProjetoFinalWeb.PedidosJSON do
  alias ProjetoFinal.Pedidos.Pedido

  def create(%{pedido: pedido}) do
    %{
      message: "Pedido criado com sucesso!",
      data: data(pedido)
    }
  end

  def get(%{pedido: pedido}), do: %{data: data(pedido)}
  defp data(%Pedido{} = pedido) do
  %{
    id: pedido.id,
    book_id: pedido.book_id,
    user_id: pedido.user_id,
    data: pedido.data,
    quantidade: pedido.quantidade
  }
  end
end
