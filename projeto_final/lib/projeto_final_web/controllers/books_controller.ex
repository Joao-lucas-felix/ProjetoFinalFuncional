defmodule ProjetoFinalWeb.BooksController do
  use ProjetoFinalWeb, :controller
  alias ProjetoFinal.Books
  alias Books.Book

  action_fallback ProjetoFinalWeb.FallbackController
  #Create
  def create(conn, params ) do
    with {:ok, %Book{} = book} <- Books.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, book: book)
    end
  end
  #Read
  def show(conn, %{"id" => id}) do
    with {:ok, %Book{} = book} <- Books.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, book: book)
    end
  end

  #Update
  def update(conn, params) do
    with {:ok, %Book{} = book} <- Books.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, book: book)
    end
  end

  #Delete
  def delete(conn, params) do
    with {:ok, %Book{} = book} <- Books.delete(params) do
      conn
      |> put_status(:ok)
      |> render(:delete, book: book)
    end
  end

end
