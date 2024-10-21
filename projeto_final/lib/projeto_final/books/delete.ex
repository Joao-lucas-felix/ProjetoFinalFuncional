defmodule ProjetoFinal.Books.Delete do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Books
  
  def call(%{"id" => id}) do
    case Repo.get(Books.Book, id) do
      nil -> {:error, :not_found}
      book -> Repo.delete(book)
    end
  end
end
