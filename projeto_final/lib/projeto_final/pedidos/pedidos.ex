defmodule ProjetoFinal.Pedidos.Pedidos do
  use Ecto.Schema
  import Ecto.Changeset


  @required_params [:user_id, :book_id, :quantidade, :data]

  schema "pedidos" do
    field :quantidade, :integer
    field :data, :naive_datetime, default: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

    belongs_to :user, ProjetoFinal.Users.User  # Relacionamento com a tabela users
    belongs_to :book, ProjetoFinal.Books.Book  # Relacionamento com a tabela books

    timestamps()
  end

  def changeset(pedido \\ %__MODULE__{}, params) do
    pedido
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_number(:quantidade, greater_than: 0)
      |> assoc_constraint(:user)
      |> assoc_constraint(:book)
      |> check_constraint(:quantidade, name: :quantidade_cant_be_negative, message: "A quantidade não pode ser negativa")
  end
end
