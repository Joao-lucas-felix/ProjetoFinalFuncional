defmodule ProjetoFinal.Pedidos.Create do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Pedidos.Pedido
  alias ProjetoFinal.Books.Book
  alias ProjetoFinal.Users.User

  def call(%{"user_id" => user_id, "book_id" => book_id, "quantidade" => quantidade} = params) do
    with %Book{} = book <- Repo.get(Book, book_id),
         %User{} = _user <- Repo.get(User, user_id),
         true <- quantidade <= book.quantidade_estoque do

      Ecto.Multi.new()
      |> atualiza_livro(book, quantidade)
      |> cria_pedido(params)
      |> Repo.transaction()
      |> handle_transaction()

    else
      false -> {:error, :invalid_transaction} # Se a quantidade é maior que o estoque
      nil -> {:error, :not_found}
      :error -> {:error, :invalid_value}
    end
  end

  defp atualiza_livro(multi, %Book{} = book, quantidade) do
    quantidade = book.quantidade_estoque - quantidade
    changeset = Book.changeset(book, %{quantidade_estoque: quantidade})
    Ecto.Multi.update(multi, :update_book_estoque, changeset)
  end

  defp cria_pedido(multi, params) do
    changeset = Pedido.changeset(params)
    Ecto.Multi.insert(multi, :create_pedido, changeset) # Corrigido o nome da operação
  end

  defp handle_transaction({:ok, %{create_pedido: pedido}}), do: {:ok, pedido}
  defp handle_transaction({:error, :invalid_transaction}), do: {:error, :invalid_transaction}
  defp handle_transaction({:error, _op, reason, _}), do: {:error, reason}
end
