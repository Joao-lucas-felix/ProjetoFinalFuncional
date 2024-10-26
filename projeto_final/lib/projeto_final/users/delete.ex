defmodule ProjetoFinal.Users.Delete do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Users

  def call(%{"id" => id}) do
    case Repo.get(Users.User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
