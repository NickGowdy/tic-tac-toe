defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService}

  def new(conn, _params) do
    json(conn, GameService.start_game())
  end

  def show(conn, %{"id" => id}) do
    grid = GameService.get_game(id)
    json(conn, grid)
  end

  def update(conn = %{body_params: body_params}, %{"id" => id}) do
    IO.inspect(body_params)
    grid = GameService.update_game(id, body_params)
    json(conn, grid)
  end
end
