defmodule Rinha.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rinha.Accounts` context.
  """

  @doc """
  Generate a pessoa.
  """
  def pessoa_fixture(attrs \\ %{}) do
    {:ok, pessoa} =
      attrs
      |> Enum.into(%{
        stack: ["option1", "option2"],
        apelido: "some apelido",
        nome: "some nome",
        nascimento: ~D[2023-09-30]
      })
      |> Rinha.Accounts.create_pessoa()

    pessoa
  end
end
