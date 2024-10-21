defmodule ProjetoFinal.Books.Create do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Books.Book
  def call(params) do
    %Book{}
    |> Book.changeset(params)
    |> Repo.insert
  end
end
