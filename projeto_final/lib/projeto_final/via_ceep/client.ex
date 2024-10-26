defmodule ProjetoFinal.ViaCeep.Client do
  use Tesla
  alias  ProjetoFinal.ViaCeep.ClientBehavior
  @behaviour ProjetoFinal.ViaCeep.ClientBehavior

  @default_url "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON


  @impl ClientBehavior
  def call(url \\ @default_url, ceep) do
    "#{url}/#{ceep}/json"
    |> get()
    |> handle_response
  end

  def handle_response({:ok, %Tesla.Env{status: 200, body: %{"erro" => "true"}}}),
    do: {:error, :not_found}

  def handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  def handle_response({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  def handle_response({:error, _}) do
    {:error, :internal_server_error}
  end
end
