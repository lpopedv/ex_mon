defmodule ExMon.Game do
  @moduledoc false

  use Agent

  def start(computer, player) do
    initial_value = %{
      computer: computer,
      player: player,
      status: :started,
      turn: :player
    }

    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info, do: Agent.get(__MODULE__, & &1)

  def update(state), do: Agent.update(__MODULE__, fn _ -> state end)

  def player, do: Map.get(info(), :player)
  def turn, do: Map.get(info(), :turn)
  def fetch_player(player), do: Map.get(info(), player)
end
