defmodule ProjetoFinal.Users.Update do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Users.User
  alias ProjetoFinal.ViaCeep.Client, as: ViaCeepClient

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user,%{"ceep" => ceep} = params) do
    with {:ok, _result} <- ViaCeepClient.call(ceep) do
      user
      |> User.changeset(params)
      |> Repo.update()
    end
  end
end
