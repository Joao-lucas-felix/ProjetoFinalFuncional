defmodule ProjetoFinalWeb.UsersController do
  use ProjetoFinalWeb, :controller
  alias ProjetoFinal.Users
  alias Users.User

  action_fallback ProjetoFinalWeb.FallbackController

  def create(conn, params ) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
  #Read
  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end

  #Update
  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  #Delete
  def delete(conn, params) do
    with {:ok, %User{} = user} <- Users.delete(params) do
      conn
      |> put_status(:ok)
      |> render(:delete, user: user)
    end
  end


end
