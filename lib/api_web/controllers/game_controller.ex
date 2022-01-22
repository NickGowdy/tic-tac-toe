defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService}

  def index(conn, _params) do
    grid = GameService.start_game()
    json(conn, grid)
  end

  def update(conn, _params) do
    json(conn, %{value: "Value updated."})
  end
end
