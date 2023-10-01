defmodule RinhaWeb.PessoaController do
  use RinhaWeb, :controller

  alias Rinha.Accounts
  alias Rinha.Accounts.Pessoa

  action_fallback RinhaWeb.FallbackController

  def index(conn, _params) do
    pessoas = Accounts.list_pessoas()
    render(conn, :index, pessoas: pessoas)
  end

  def create(conn, %{"pessoa" => pessoa_params}) do
    with {:ok, %Pessoa{} = pessoa} <- Accounts.create_pessoa(pessoa_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pessoas/#{pessoa}")
      |> render(:show, pessoa: pessoa)
    end
  end

  def show(conn, %{"id" => id}) do
    pessoa = Accounts.get_pessoa!(id)
    render(conn, :show, pessoa: pessoa)
  end

  def update(conn, %{"id" => id, "pessoa" => pessoa_params}) do
    pessoa = Accounts.get_pessoa!(id)

    with {:ok, %Pessoa{} = pessoa} <- Accounts.update_pessoa(pessoa, pessoa_params) do
      render(conn, :show, pessoa: pessoa)
    end
  end

  def delete(conn, %{"id" => id}) do
    pessoa = Accounts.get_pessoa!(id)

    with {:ok, %Pessoa{}} <- Accounts.delete_pessoa(pessoa) do
      send_resp(conn, :no_content, "")
    end
  end
end
