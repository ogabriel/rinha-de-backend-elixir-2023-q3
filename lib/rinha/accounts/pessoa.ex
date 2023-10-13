defmodule Rinha.Accounts.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pessoas" do
    field :apelido, :string
    field :nome, :string
    field :nascimento, :date
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
    |> unique_constraint(:apelido)
    |> validate_stack
    |> build_busca
  end

  defp validate_stack(changeset) do
    with true <- Enum.empty?(changeset.errors),
         stack <- get_field(changeset, :stack),
         true <- is_list(stack),
         false <- Enum.all?(stack, &(is_binary(&1) && byte_size(&1) in 1..32)) do
      add_error(changeset, :stack, "is invalid", type: :string, validation: :cast)
    else
      _ -> changeset
    end
  end

  defp build_busca(changeset) do
    with true <- Enum.empty?(changeset.errors),
         apelido <- get_field(changeset, :apelido),
         nome <- get_field(changeset, :nome),
         stack <- haandle_stack(get_field(changeset, :stack)),
         busca <- "#{apelido} #{nome} #{stack}" |> String.downcase() do
      changeset
      |> put_change(:busca, busca)
    else
      _ -> changeset
    end
  end

  defp haandle_stack(stack) when is_list(stack) do
    stack
    |> Enum.map(&String.downcase/1)
    |> Enum.join(" ")
  end

  defp haandle_stack(_), do: ""
end
