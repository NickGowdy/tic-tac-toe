defmodule TicTacToe.Web.PageController do
  use TicTacToe.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
