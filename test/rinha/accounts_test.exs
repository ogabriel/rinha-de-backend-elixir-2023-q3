defmodule Rinha.AccountsTest do
  use Rinha.DataCase

  alias Rinha.Accounts

  describe "pessoas" do
    alias Rinha.Accounts.Pessoa

    import Rinha.AccountsFixtures

    @invalid_attrs %{stack: nil, apelido: nil, nome: nil, nascimento: nil}

    test "list_pessoas/0 returns all pessoas" do
      pessoa = pessoa_fixture()
      assert Accounts.list_pessoas() == [pessoa]
    end

    test "get_pessoa!/1 returns the pessoa with given id" do
      pessoa = pessoa_fixture()
      assert Accounts.get_pessoa!(pessoa.id) == pessoa
    end

    test "create_pessoa/1 with valid data creates a pessoa" do
      valid_attrs = %{stack: ["option1", "option2"], apelido: "some apelido", nome: "some nome", nascimento: ~D[2023-09-30]}

      assert {:ok, %Pessoa{} = pessoa} = Accounts.create_pessoa(valid_attrs)
      assert pessoa.stack == ["option1", "option2"]
      assert pessoa.apelido == "some apelido"
      assert pessoa.nome == "some nome"
      assert pessoa.nascimento == ~D[2023-09-30]
    end

    test "create_pessoa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pessoa(@invalid_attrs)
    end

    test "update_pessoa/2 with valid data updates the pessoa" do
      pessoa = pessoa_fixture()
      update_attrs = %{stack: ["option1"], apelido: "some updated apelido", nome: "some updated nome", nascimento: ~D[2023-10-01]}

      assert {:ok, %Pessoa{} = pessoa} = Accounts.update_pessoa(pessoa, update_attrs)
      assert pessoa.stack == ["option1"]
      assert pessoa.apelido == "some updated apelido"
      assert pessoa.nome == "some updated nome"
      assert pessoa.nascimento == ~D[2023-10-01]
    end

    test "update_pessoa/2 with invalid data returns error changeset" do
      pessoa = pessoa_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pessoa(pessoa, @invalid_attrs)
      assert pessoa == Accounts.get_pessoa!(pessoa.id)
    end

    test "delete_pessoa/1 deletes the pessoa" do
      pessoa = pessoa_fixture()
      assert {:ok, %Pessoa{}} = Accounts.delete_pessoa(pessoa)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pessoa!(pessoa.id) end
    end

    test "change_pessoa/1 returns a pessoa changeset" do
      pessoa = pessoa_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pessoa(pessoa)
    end
  end
end
