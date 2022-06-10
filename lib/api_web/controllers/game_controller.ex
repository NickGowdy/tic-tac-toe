defmodule TicTacToe.Web.GameController do
  use TicTacToe.Web, :controller

  alias TicTacToe.{GameService}

  def new(conn, _params) do
    json(conn, GameService.start_game())
  end

  def show(conn, %{"id" => id}) do
    %{id: _game_id, grid: grid} = GameService.get_game(id)

    json(conn, grid)
  end

  def update(conn = %{body_params: body_params}, %{"id" => id}) do
    case GameService.update_game(id, body_params) do
      %{id: _game_id, grid: grid} ->
        json(conn, grid)

      {:error, msg} ->
        conn
        |> put_status(500)
        |> text(msg)
    end
  end
end
