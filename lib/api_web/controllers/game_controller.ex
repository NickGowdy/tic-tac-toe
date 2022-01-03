defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  def index(conn, _params) do
    json(conn, %{value: "Hello... World."})
  end

  def update(conn, _params) do
    json(conn, %{value: "Value updated."})
  end
end
