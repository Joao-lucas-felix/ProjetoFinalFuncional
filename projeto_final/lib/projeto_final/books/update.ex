defmodule ProjetoFinal.Books.Update do
  alias ProjetoFinal.Books.Book
  alias ProjetoFinal.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Book, id) do
      nil -> {:error, :not_found}
      book -> update(book, params)
    end
  end
  defp update(book, params) do
    book
    |> Book.changeset(params)
    |> Repo.update
  end
end
