defmodule Rinha.Repo.Migrations.AddIndexesToPessoas do
  use Ecto.Migration

  def change do
    create unique_index(:pessoas, [:apelido])
  end
end
