defmodule Rinha.Accounts.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pessoas" do
    field :apelido, :string
    field :nome, :string
    field :nascimento, :string
    field :stack, {:array, :string}
    field :busca, :string

    timestamps()
  end

  @doc false
  def changeset(pessoa, attrs) do
    pessoa
    |> cast(attrs, [:apelido, :nome, :nascimento, :stack], empty_values: [])
    |> unique_constraint(:apelido)
    |> build_busca
  end

  defp build_busca(%{errors: []} = changeset) do
    busca =
      [get_field(changeset, :apelido), get_field(changeset, :nome) | get_field(changeset, :stack) || []]
      |> Enum.map_join(" ", &String.downcase(&1, :ascii))

    put_change(changeset, :busca, busca)
  end

  defp build_busca(changeset), do: changeset
end
