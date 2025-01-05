defmodule ExMon.Game.Status do
  @moduledoc false

  alias Exmon.Game

  def print_round_message do
    IO.puts("\n====== The game is started! ======")
    IO.inspect(Game.info())
    IO.puts("-------------------------------")
  end

  def print_wrong_move_message(move), do: IO.puts("\n====== Invalid move: #{move} ======")

  def print_move_message(:computer, :attack, damage),
    do: IO.puts("\n====== The player attacked the computer dealing #{damage} damage ======")

  def print_move_message(:player, :attack, damage),
    do: IO.puts("\n====== The computer attacked the player dealing #{damage} damage ======")
end
