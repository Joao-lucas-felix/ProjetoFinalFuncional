defmodule ProjetoFinal.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @book_required_params [:titulo, :description, :price, :quantidade_estoque, :author_name, :name_editora]

  schema "books" do
    field :titulo, :string
    field :description, :string
    field :price, :decimal
    field :quantidade_estoque, :integer
    field :author_name, :string
    field :name_editora, :string

    timestamps()
  end

  def changeset(book \\ %__MODULE__{}, params) do
    book
    |> cast(params, @book_required_params)
    |> validate_required(@book_required_params)
    |> validate_length(:titulo, min: 5)
    |> validate_length(:description, min: 5)
    |> validate_length(:author_name, min: 3)
    |> validate_length(:name_editora, min: 5)
    |> check_constraint(:price, name: :price_cant_be_negative)
    |> check_constraint(:quantidade_estoque, name: :quantidade_estoque_cant_be_negative)
  end
end
