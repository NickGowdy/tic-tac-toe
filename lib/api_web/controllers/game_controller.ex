defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService}

  def new(conn, _params) do
    json(conn, GameService.start_game())
  end

  def show(conn, %{"id" => id}) do
    IO.inspect(id)
    grid = GameService.get_game(id)
    json(conn, grid)
  end

  # TODO - get specific game using ID

  def update(conn, %{"id" => id, "square" => square}) do
   json(conn, %{value: square.x})
  end
end
