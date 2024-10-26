defmodule ProjetoFinalWeb.FallbackController do
  use ProjetoFinalWeb, :controller

  def call(con, {:error, :not_found}) do
    con
    |> put_status(:not_found)
    |> put_view(json: ProjetoFinalWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(con, {:error, :bad_request}) do
    con
    |> put_status(:bad_request)
    |> put_view(json: ProjetoFinalkWeb.ErrorJSON)
    |> render(:error, status: :bad_request)
  end

  def call(con, {:error, %Ecto.Changeset{} = changeset}) do
    con
    |> put_status(:bad_request)
    |> put_view(json: ProjetoFinalWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end

  def call(con, {:error, message }) do
    con
    |> put_status(:bad_request)
    |> put_view(json: ProjetoFinalWeb.ErrorJSON)
    |> render(:error, message: message)
  end


end
