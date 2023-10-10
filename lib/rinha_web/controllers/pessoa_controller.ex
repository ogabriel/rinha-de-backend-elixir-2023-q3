defmodule RinhaWeb.PessoaController do
  use RinhaWeb, :controller

  alias Rinha.Accounts
  alias Rinha.Accounts.Pessoa

  action_fallback RinhaWeb.FallbackController

  def create(conn, pessoa_params) do
    with {:ok, %Pessoa{} = pessoa} <- Accounts.create_pessoa(pessoa_params),
         {:ok, _} <- Cachex.put(:pessoas_id, pessoa.id, pessoa),
         {:ok, _} <- Cachex.put(:pessoas_apelido, pessoa.apelido, true) do
      conn
      |> put_status(201)
      |> put_resp_header("location", ~p"/pessoas/#{pessoa}")
      |> text("")
    else
      {:error, changeset} ->
        if invalid_types?(changeset) do
          conn
          |> put_status(400)
          |> text("")
        else
          conn
          |> put_status(422)
          |> text("")
        end
    end
  end

  defp invalid_types?(changeset) do
    Enum.any?(changeset.errors, fn {_, {_, error_data}} ->
      error_data[:validation] in [:cast]
    end)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, _} = Ecto.UUID.cast(id),
         %Pessoa{} = pessoa <- Accounts.get_pessoa(id) do
      conn
      |> put_status(200)
      |> render(:show, pessoa: pessoa)
    else
      _ ->
        conn
        |> put_status(404)
        |> json(%{})
    end
  end

  def search(conn, %{"t" => search_term}) do
    if is_binary(search_term) && byte_size(search_term) in 1..100 do
      pessoas = Accounts.search_pessoas(search_term)

      conn
      |> put_status(200)
      |> render(:index, pessoas: pessoas)
    else
      conn
      |> put_status(400)
      |> text("")
    end
  end

  def count(conn, _params) do
    count = Accounts.count_pessoas()

    conn
    |> put_status(:ok)
    |> text(count)
  end
end
