defmodule RinhaWeb.PessoaController do
  use RinhaWeb, :controller

  alias Rinha.Accounts
  alias Rinha.Accounts.Pessoa

  def create(conn, pessoa_params) do
    cond do
      missing_params?(pessoa_params) ->
        send_resp(conn, 422, "")

      incorrect_types?(pessoa_params) ->
        send_resp(conn, 400, "")

      incorrect_sizes?(pessoa_params) ->
        send_resp(conn, 422, "")

      incorrect_stack?(pessoa_params) ->
        send_resp(conn, 400, "")

      true ->
        with {:ok, %Pessoa{} = pessoa} <- Accounts.create_pessoa(pessoa_params) do
          conn
          |> put_status(201)
          |> put_resp_header("location", ~p"/pessoas/#{pessoa}")
          |> text("")
        else
          _ ->
            send_resp(conn, 422, "")
        end
    end
  end

  defp missing_params?(%{"apelido" => apelido, "nome" => nome, "nascimento" => nascimento}) do
    is_nil(apelido) || is_nil(nome) || is_nil(nascimento)
  end

  defp incorrect_types?(%{"apelido" => apelido, "nome" => nome, "nascimento" => nascimento}) do
    not (is_binary(apelido) && is_binary(nome) && valid_date?(nascimento))
  end

  defp valid_date?(nascimento) do
    with true <- is_binary(nascimento),
         true <- byte_size(nascimento) == 10,
         {:ok, _} <- Date.from_iso8601(nascimento) do
      true
    else
      _ -> false
    end
  end

  defp incorrect_sizes?(%{"apelido" => apelido, "nome" => nome}) do
    not (byte_size(apelido) in 1..32 &&
           byte_size(nome) in 1..100)
  end

  defp incorrect_stack?(%{"stack" => nil}), do: false

  defp incorrect_stack?(%{"stack" => stack}) do
    not (is_list(stack) &&
           Enum.all?(stack, fn x -> is_binary(x) && byte_size(x) in 1..32 end))
  end

  def show(conn, %{"id" => id}) do
    with {:ok, _} <- Ecto.UUID.cast(id),
         %Pessoa{} = pessoa <- Accounts.get_pessoa(id) do
      conn
      |> put_status(200)
      |> render(:show, pessoa: pessoa)
    else
      _ ->
        send_resp(conn, 404, "")
    end
  end

  def search(conn, %{"t" => search_term}) do
    if is_binary(search_term) && byte_size(search_term) in 1..100 do
      pessoas = Accounts.search_pessoas(search_term)

      conn
      |> put_status(200)
      |> render(:index, pessoas: pessoas)
    else
      send_resp(conn, 400, "")
    end
  end

  def count(conn, _params) do
    count = Accounts.count_pessoas()

    conn
    |> put_status(:ok)
    |> text(count)
  end
end
