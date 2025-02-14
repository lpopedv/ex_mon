defmodule ExMon.Game.Status do
  @moduledoc false

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n====== The game is started! ======")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n====== It's #{player} turn ======")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n====== The game is over. ======")
    IO.inspect(info)
    IO.puts("-------------------------------")
  end

  def print_wrong_move_message(move), do: IO.puts("\n====== Invalid move: #{move} ======")

  def print_move_message(:computer, :attack, damage),
    do: IO.puts("\n====== The player attacked the computer dealing #{damage} damage ======")

  def print_move_message(:player, :attack, damage),
    do: IO.puts("\n====== The computer attacked the player dealing #{damage} damage ======")

  def print_move_message(player, :heal, life),
    do: IO.puts("\n====== The #{player} healled itself to #{life} life points ======")
end
