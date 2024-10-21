defmodule ProjetoFinal.Repo.Migrations.CreateTableUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nome, :string, null: false
      add :cpf, :string, null: false
      add :ceep, :string, null: false
    end
    create unique_index(:users, [:cpf])
  end
end
