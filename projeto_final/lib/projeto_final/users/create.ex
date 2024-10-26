defmodule ProjetoFinal.Users.Create do
  alias ProjetoFinal.Repo
  alias ProjetoFinal.Users.User
  alias ProjetoFinal.ViaCeep.Client, as: ViaCeepClient

  def call(%{"ceep" => ceep} = params) do
    with {:ok, _result} <- ViaCeepClient.call(ceep) do
      %User{}
      |> User.changeset(params)
      |> Repo.insert()
    end
  end
end
