defmodule TicTacToe.GameService do
  alias TicTacToe.{GameServer}

  def start_game() do
    {:ok, game_id} = GameServer.start_link([])
    { game_id, [head | tail]} = GameServer.get_grid(game_id)
    game_id
  end

  def get_game(id) do
    grid = GameServer.get_grid("pid")
    grid
  end
end
