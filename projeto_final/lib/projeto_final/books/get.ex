defmodule ProjetoFinal.Books.Get do
alias ProjetoFinal.Books
alias ProjetoFinal.Repo

  def call(id) do
    case Repo.get(Books.Book, id ) do
      nil -> {:error, :not_found}
      book -> {:ok, book}
    end
  end
end
