defmodule RinhaWeb.PessoaJSON do
  alias Rinha.Accounts.Pessoa

  @doc """
  Renders a list of pessoas.
  """
  def index(%{pessoas: pessoas}) do
    for(pessoa <- pessoas, do: show(%{pessoa: pessoa}))
  end

  @doc """
  Renders a single pessoa.
  """
  def show(%{pessoa: %Pessoa{} = pessoa}) do
    %{
      apelido: pessoa.apelido,
      nome: pessoa.nome,
      nascimento: pessoa.nascimento,
      stack: pessoa.stack
    }
  end
end
