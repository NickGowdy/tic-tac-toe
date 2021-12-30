defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  def index(conn, _params) do
    json(conn, %{value: "Hello... World."})
  end
end
