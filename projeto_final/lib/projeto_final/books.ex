defmodule ProjetoFinal.Books do
  alias ProjetoFinal.Books.Delete
  alias ProjetoFinal.Books.Get
  alias ProjetoFinal.Books.Update
  alias ProjetoFinal.Books.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate delete(id), to: Delete, as: :call

end
