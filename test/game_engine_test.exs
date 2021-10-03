defmodule GridServiceTest do
  use ExUnit.Case, async: true
  doctest TicTacToe.GameEngine

  alias TicTacToe.{GridFactory, GameEngine}
  alias TicTacToe.Entities.Square

  describe "Logic to confirm game logic is working for all possible combinations" do
    test "Return true when complete combination is vertical" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 2}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == true
    end

    test "Return false there is not a complete vertical combination" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 1}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == false
    end

    test "Return true when complete combination is horizontal" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 2, y: 0}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == true
    end

    test "Return false there is not a complete horizontal combination" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 0}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == false
    end

    test "Return true when complete combination in diagonal 1" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 1},
        %TicTacToe.Entities.Square{player: 1, x: 2, y: 2}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == true
    end

    test "Return false when x and y not equal same value for diagonal 1" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 2},
        %TicTacToe.Entities.Square{player: 1, x: 2, y: 2}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == false
    end

    test "Return true when complete combination in diagonal 2" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 2},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 1},
        %TicTacToe.Entities.Square{player: 1, x: 2, y: 0}
      ]

      result = GameEngine.is_winner(grid, 1)
      assert result == true
    end

    test "Return false as there is no winner" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 1},
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 2},
        %TicTacToe.Entities.Square{player: 1, x: 1, y: 2},
        %TicTacToe.Entities.Square{player: 1, x: 2, y: 1},
        %TicTacToe.Entities.Square{player: 2, x: 0, y: 1},
        %TicTacToe.Entities.Square{player: 2, x: 1, y: 0},
        %TicTacToe.Entities.Square{player: 2, x: 2, y: 2},
        %TicTacToe.Entities.Square{player: 2, x: 2, y: 0}
      ]

      result_player_one = GameEngine.is_winner(grid, 1)
      assert result_player_one == false

      result_player_two = GameEngine.is_winner(grid, 2)
      assert result_player_two == false
    end
  end

  describe "Logic to check if correct player is taking his turn" do
    test "Happy path where turns are taken in correct order" do
      grid = [
        %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      ]

      result_player_one = GameEngine.is_winner(grid, 1)
      assert result_player_one == false

    end

  end

end
