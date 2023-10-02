defmodule RinhaWeb.Router do
  use RinhaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RinhaWeb do
    pipe_through :api

    resources "/pessoas", PessoaController, only: [:show, :create]
    get "/pessoas", PessoaController, :search
    get "/contagem-pessoas", PessoaController, :count
  end
end
