defmodule Rinha.Accounts.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pessoas" do
    field :stack, {:array, :string}
    field :apelido, :string
    field :nome, :string
    field :nascimento, :date

    timestamps()
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs, [:apelido, :nome, :nascimento, :stack])
    |> validate_required([:apelido, :nome, :nascimento, :stack])
  end
end
