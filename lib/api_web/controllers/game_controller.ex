defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService, Entities.Game}

  def new(conn, _params) do
    json(conn, GameService.start_game())
  end

  def show(conn, %{"id" => id}) do
    json(conn, GameService.get_game(id))
  end

  def update(conn = %{body_params: body_params}, %{"id" => id}) do
    case GameService.update_game(id, body_params) do
      %Game{id: game_id, grid: grid, winner: winner} ->
        json(conn, %Game{id: game_id, grid: grid, winner: winner} )

      {:error, msg} ->
        conn
        |> put_status(500)
        |> text(msg)
    end
  end
end
