defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  def index(conn, _params) do
    json(conn, %{value: "Hello... World."})
  end

  def update(conn, params) do
    IO.inspect(params, label: "Params @@@@@@")
    json(conn, %{value: "Value updated."})
  end
end
