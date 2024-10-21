defmodule ProjetoFinalWeb.BooksJSON do
  alias ProjetoFinal.Books.Book

  def create(%{book: book}) do
    %{
      message: "Livro criado com sucesso!",
      data: data(book)
    }
  end

  def get(%{book: book}), do: %{data: data(book)}
  def update(%{book: book}) do
    %{
      message: "Informações do Livro atualizadas com sucesso ",
      data: data(book)
    }
  end

  def delete(%{book: book}) do
    %{
      message: "book deleted",
      data: data(book)
    }
  end

  defp data(%Book{} = book) do
  %{
    id: book.id,
    titulo: book.titulo,
    description: book.description,
    price: book.price,
    quantidade_estoque: book.quantidade_estoque,
    author_name: book.author_name,
    name_editora: book.name_editora
  }
  end
end
