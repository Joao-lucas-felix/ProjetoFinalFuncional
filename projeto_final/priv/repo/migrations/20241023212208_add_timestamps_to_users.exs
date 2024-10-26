defmodule ProjetoFinal.Repo.Migrations.AddTimestampsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      timestamps(type: :naive_datetime, default: fragment("NOW()"))
    end
  end
end
