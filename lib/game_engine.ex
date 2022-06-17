defmodule TicTacToe.GameEngine do
  alias TicTacToe.Entities.Square

  @spec is_valid_player(number) :: boolean()
  def is_valid_player(player), do: player in [1, 2]

  @doc ~S"""
  Calculates if the player which is provided as a parameter is the winner

  ## Examples

      iex> grid = [
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 2}]
      iex> TicTacToe.GameEngine.winner(grid, 1)
      true
  """
  @spec winner(list(%Square{}), integer()) :: boolean
  def winner([%Square{} | _rest] = grid, player) do
    player_grid = Enum.filter(grid, fn square -> square.player == player end)
    winner_list = []
    dimensions = Enum.to_list(0..2)

    case Enum.count(player_grid) < 3 do
      true ->
        false

      false ->
        winner_list
        |> List.insert_at(0, maybe_winner_x([%Square{} | _rest] = player_grid, dimensions))
        |> List.insert_at(0, maybe_winner_y([%Square{} | _rest] = player_grid, dimensions))
        |> List.insert_at(0, maybe_winner_x_y_1([%Square{} | _rest] = player_grid, dimensions))
        |> List.insert_at(0, maybe_winner_x_y_2([%Square{} | _rest] = player_grid, dimensions))
        |> Enum.any?(fn x -> x == true end)
    end
  end

  defp maybe_winner_x([%Square{} | _rest] = grid, dimensions) do
    dimensions
    |> Enum.any?(fn d -> Enum.count(grid, fn square -> square.x == d end) == 3 end)
  end

  defp maybe_winner_y([%Square{} | _rest] = grid, dimensions) do
    dimensions
    |> Enum.any?(fn d -> Enum.count(grid, fn square -> square.y == d end) == 3 end)

  end

  defp maybe_winner_x_y_1([%Square{} | _rest] = grid, dimensions) do
    {_, selected_squares} =
      dimensions
      |> Enum.map_reduce(0, fn _, acc ->
        maybe_square =
          Enum.find(grid, fn square -> square.x == acc and square.y == acc end) != nil

        if maybe_square == true, do: {maybe_square, acc + 1}, else: {maybe_square, acc}
      end)

    selected_squares == 3
  end

  defp maybe_winner_x_y_2([%Square{} | _rest] = grid, dimensions) do
    {_, selected_squares} =
      dimensions
      |> Enum.map_reduce(2, fn d, acc ->
        maybe_square = Enum.find(grid, fn square -> square.y == acc and square.x == d end) != nil

        if maybe_square == true, do: {maybe_square, acc - 1}, else: {maybe_square, acc}
      end)

    selected_squares == -1
  end
end
