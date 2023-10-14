defmodule Rinha.Accounts.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:apelido, :nome, :nascimento, :stack])
    |> validate_required([:apelido, :nome, :nascimento])
    |> validate_length(:apelido, count: :bytes, min: 1, max: 32)
    |> validate_length(:nome, count: :bytes, min: 1, max: 100)
    |> validate_nascimento
    |> validate_apelido_with_cache
    |> unique_constraint(:apelido)
    |> validate_stack
    |> build_busca
  end

  defp validate_nascimento(%{errors: []} = changeset) do
    with nascimento <- get_field(changeset, :nascimento),
         {:ok, _} <- Date.from_iso8601(nascimento) do
      changeset
    else
      _ -> add_error(changeset, :nascimento, "is invalid", type: :date, validation: :cast)
    end
  end

  defp validate_nascimento(changeset), do: changeset

  defp validate_apelido_with_cache(%{errors: []} = changeset) do
    with apelido <- get_field(changeset, :apelido),
         {:ok, true} <- Cachex.get(:rinha, "apelido:#{apelido}") do
      add_error(changeset, :nome, "must be a valid string")
    else
      _ -> changeset
    end
  end

  defp validate_apelido_with_cache(changeset), do: changeset

  defp validate_stack(%{errors: []} = changeset) do
    with stack <- get_field(changeset, :stack),
         true <- is_list(stack),
         false <- Enum.all?(stack, &(is_binary(&1) && byte_size(&1) in 1..32)) do
      add_error(changeset, :stack, "is invalid", type: :string, validation: :cast)
    else
      _ -> changeset
    end
  end

  defp validate_stack(changeset), do: changeset

  defp build_busca(%{errors: []} = changeset) do
    busca =
      [get_field(changeset, :apelido), get_field(changeset, :nome) | get_field(changeset, :stack) || []]
      |> Enum.map_join(" ", &String.downcase(&1, :ascii))

    put_change(changeset, :busca, busca)
  end

  defp build_busca(changeset), do: changeset
end
