defmodule Rinha.Repo.Migrations.AddIndexesToPessoas do
  use Ecto.Migration

  def change do
    create unique_index(:pessoas, [:apelido])

    execute("CREATE EXTENSION pg_trgm")
    create index(:pessoas, ["busca gist_trgm_ops"], using: :gist)
  end
end
