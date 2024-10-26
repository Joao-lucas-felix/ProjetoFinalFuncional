defmodule ProjetoFinal.Users do
  alias ProjetoFinal.Users.Delete
  alias ProjetoFinal.Users.Get
  alias ProjetoFinal.Users.Update
  alias ProjetoFinal.Users.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate delete(id), to: Delete, as: :call

end
