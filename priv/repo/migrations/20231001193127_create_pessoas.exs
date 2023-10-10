defmodule Rinha.Repo.Migrations.CreatePessoas do
  use Ecto.Migration

  def change do
    create table(:pessoas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :apelido, :string
      add :nome, :string
      add :nascimento, :date
      add :stack, {:array, :string}
      add :busca, :text

      timestamps()
    end
  end
end
