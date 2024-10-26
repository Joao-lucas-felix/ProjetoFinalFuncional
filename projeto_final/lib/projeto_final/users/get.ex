defmodule ProjetoFinal.Users.Get do
  alias ProjetoFinal.Users
  alias ProjetoFinal.Repo

    def call(id) do
      case Repo.get(Users.User, id ) do
        nil -> {:error, :not_found}
        user -> {:ok, user}
      end
    end
  end
