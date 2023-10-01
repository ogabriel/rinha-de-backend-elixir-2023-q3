defmodule RinhaWeb.PessoaJSON do
  alias Rinha.Accounts.Pessoa

  @doc """
  Renders a list of pessoas.
  """
  def index(%{pessoas: pessoas}) do
    %{data: for(pessoa <- pessoas, do: data(pessoa))}
  end

  @doc """
  Renders a single pessoa.
  """
  def show(%{pessoa: pessoa}) do
    %{data: data(pessoa)}
  end

  defp data(%Pessoa{} = pessoa) do
    %{
      id: pessoa.id,
      apelido: pessoa.apelido,
      nome: pessoa.nome,
      nascimento: pessoa.nascimento,
      stack: pessoa.stack
    }
  end
end
