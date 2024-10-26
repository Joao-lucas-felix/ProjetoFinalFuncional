defmodule ProjetoFinalWeb.UsersJSON do
  alias ProjetoFinal.Users.User

  def create(%{user: user}) do
    %{
      message: "Usuario criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}) do
    %{
      message: "Informações do Usuario atualizadas com sucesso ",
      data: data(user)
    }
  end

  def delete(%{user: user}) do
    %{
      message: "Usuario Deletado",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
  %{
    id: user.id,
    titulo: user.nome,
    description: user.cpf,
    price: user.ceep
  }
  end
end
