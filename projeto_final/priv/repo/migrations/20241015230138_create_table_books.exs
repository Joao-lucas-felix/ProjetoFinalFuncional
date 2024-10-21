defmodule ProjetoFinal.Repo.Migrations.CreateTableBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :titulo, :string, null: false
      add :description, :text, null: false
      add :price, :decimal, null: false
      add :quantidade_estoque, :integer, null: false
      add :author_name, :string, null: false
      add :name_editora, :string, null: false

      timestamps(type: :naive_datetime, default: fragment("NOW()"))
    end

    create constraint(:books, :price_cant_be_negative, check: "price >= 0")
    create constraint(:books, :quantidade_estoque_cant_be_negative, check: "quantidade_estoque >= 0")


  end
end
