defmodule ProjetoFinalWeb.HelloApiController do
  use ProjetoFinalWeb, :controller
  # recebe uma conexão e os parametors
  def index(con, _param) do
    con
    |> put_status(:not_found)
    |> json(%{message: "Hello World", status: :ok})
  end
end
