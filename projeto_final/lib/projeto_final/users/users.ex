defmodule ProjetoFinal.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:nome, :cpf, :ceep]

  schema "users" do  # corrigido para aspas
    field :nome, :string
    field :cpf, :string
    field :ceep, :string
    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do 
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nome, min: 5)
    |> validate_length(:ceep, is: 8)
    |> validate_length(:cpf, is: 14)
    |> validate_format(:cpf, ~r/^\d{3}\.\d{3}\.\d{3}-\d{2}$/, message: "CPF deve estar no formato XXX.XXX.XXX-XX")
  end
end
