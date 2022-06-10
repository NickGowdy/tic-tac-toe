defmodule TicTacToe.GameEngine do
  alias TicTacToe.Entities.Square

  @spec is_valid_player(number) :: boolean()
  def is_valid_player(player) do
    IO.inspect(player, label: "I am player.....")
    player == 1 || player == 2
  end

  @doc ~S"""
  Calculates if the player which is provided as a parameter is the winner

  ## Examples

      iex> grid = [
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
      ...>  %TicTacToe.Entities.Square{player: 1, x: 0, y: 2}]
      iex> TicTacToe.GameEngine.is_winner(grid, 1)
      true
  """
  @spec is_winner(list(%Square{}), integer()) :: boolean
  def is_winner([%Square{} | _rest] = grid, player) do
    filtered_grid = Enum.filter(grid, fn square -> square.player == player end)

    case Enum.count(filtered_grid) < 3 do
      true ->
        false

      false ->
        filtered_grid
        |> check_grid()
    end
  end

  defp check_grid([%Square{} | _rest] = grid) do
    dimensions = Enum.to_list(0..2)

    maybe_vertical_winner =
      dimensions
      |> Enum.map(fn d -> Enum.count(grid, fn square -> square.x == d end) == 3 end)
      |> Enum.any?(fn match -> match == true end)

    maybe_horizontal_winner =
      dimensions
      |> Enum.map(fn d -> Enum.count(grid, fn square -> square.y == d end) == 3 end)
      |> Enum.any?(fn match -> match == true end)

    maybe_diagonal_winner_one = maybe_diagonal_winner_one(dimensions, grid)
    maybe_diagonal_winner_two = maybe_diagonal_winner_two(dimensions, grid)

    maybe_vertical_winner == true or maybe_horizontal_winner == true or
      maybe_diagonal_winner_one == true or maybe_diagonal_winner_two == true
  end

  defp maybe_diagonal_winner_one(dimensions, grid) do
    {_, selected_squares} =
      dimensions
      |> Enum.map_reduce(0, fn _, acc ->
        maybe_square =
          Enum.find(grid, fn square -> square.x == acc and square.y == acc end) != nil

        case maybe_square do
          true -> {maybe_square, acc + 1}
          false -> {maybe_square, acc}
        end
      end)

    selected_squares == 3
  end

  defp maybe_diagonal_winner_two(dimensions, grid) do
    {_, selected_squares} =
      dimensions
      |> Enum.map_reduce(2, fn d, acc ->
        maybe_square = Enum.find(grid, fn square -> square.y == acc and square.x == d end) != nil

        case maybe_square do
          true -> {maybe_square, acc - 1}
          false -> {maybe_square, acc}
        end
      end)

    selected_squares == -1
  end
end
