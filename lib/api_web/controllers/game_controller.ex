defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService}

  def new(conn, _params) do
    json(conn, GameService.start_game())
  end

  def show(conn, %{"id" => id}) do
    case GameService.get_game(id) do
      %{id: _game_id, grid: grid} -> json(conn, grid)
      {:error, msg} ->
        conn
          |> put_status(500)
          |> render(msg)
    end
  end

  def update(conn = %{body_params: body_params}, %{"id" => id}) do
    grid = GameService.update_game(id, body_params)
    json(conn, grid)
  end
end
