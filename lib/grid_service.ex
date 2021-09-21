defmodule TicTacToe.GridService do
  alias TicTacToe.Entities.Square

  @spec is_valid_player(number) :: true
  def is_valid_player(player) when player == 1 do
    true
  end

  def is_valid_player(player) when player == 2 do
    true
  end

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
      |> Enum.map(fn d -> Enum.count(grid, fn square -> square.x === d end) end)
      |> Enum.any?(fn val -> val === 3 end)

    maybe_horizontal_winner =
      dimensions
      |> Enum.map(fn d -> Enum.count(grid, fn square -> square.y === d end) end)
      |> Enum.any?(fn val -> val === 3 end)

    {_, selected_squares} =
      dimensions
      |> Enum.map_reduce(0, fn _, acc ->
        maybe_square = Enum.find(grid, fn square -> square.x == acc and square.y == acc end) != nil
        case maybe_square do
        true ->  {maybe_square, acc + 1}
        false -> {nil, acc}
        end
      end)

    maybe_diagonal_winner = selected_squares === 3

    maybe_vertical_winner == true or maybe_horizontal_winner == true or
      maybe_diagonal_winner == true
  end

end
