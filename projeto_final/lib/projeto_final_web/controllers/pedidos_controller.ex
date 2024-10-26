defmodule ProjetoFinalWeb.PedidosController do
  use ProjetoFinalWeb, :controller
  alias ProjetoFinal.Pedidos
  alias Pedidos.Pedido

    def create(conn, params) do
      with {:ok, %Pedido{} = pedido} <- Pedidos.create(params) do
        conn
        |> put_status(:created)
        |> render(:create, pedido: pedido)
      end

    end

  #Read
  def show(conn, %{"id" => id}) do
    with {:ok, %Pedido{} = pedido} <- Pedidos.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, pedido: pedido)
    end
  end
end
