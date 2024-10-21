defmodule ProjetoFinal.Repo.Migrations.CreateTablePedidos do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :book_id, references(:books, on_delete: :delete_all), null: false
      add :quantidade, :integer, null: false
      add :data, :naive_datetime, null: false, default: fragment("NOW()")

      timestamps()
    end

    create constraint(:pedidos, :quantidade_cant_be_negative, check: "quantidade > 0")


  end
end
