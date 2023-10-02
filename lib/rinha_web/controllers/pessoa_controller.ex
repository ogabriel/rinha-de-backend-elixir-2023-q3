defmodule RinhaWeb.PessoaController do
  use RinhaWeb, :controller

  alias Rinha.Accounts
  alias Rinha.Accounts.Pessoa

  action_fallback RinhaWeb.FallbackController

  def create(conn, pessoa_params) do
    with {:ok, %Pessoa{} = pessoa} <- Accounts.create_pessoa(pessoa_params) do
      conn
      |> put_status(201)
      |> put_resp_header("location", ~p"/api/pessoas/#{pessoa}")
      |> render(:show, pessoa: pessoa)
    else
      _ ->
        conn
        |> put_status(422)
        |> json("")
    end
  end

  def show(conn, %{"id" => id}) do
    pessoa = Accounts.get_pessoa!(id)
    render(conn, :show, pessoa: pessoa)
  end

  def count(conn, _params) do
    count = Accounts.count_pessoas()

    conn
    |> put_status(:ok)
    |> json(count)
  end
end
