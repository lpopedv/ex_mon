defmodule ExMon.GameTest do
  alias ExMon.{Game, Player}
  use ExUnit.Case

  describe "start/2" do
    test "starts the game state" do
      computer = Player.build("SkyNet", :kick, :punch, :heal)
      player = Player.build("Jon Doe", :kick, :punch, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      computer = Player.build("SkyNet", :kick, :punch, :heal)
      player = Player.build("Jon Doe", :kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        computer: %Player{
          life: 100,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "SkyNet"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "Jon Doe"
        },
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      computer = Player.build("SkyNet", :kick, :punch, :heal)
      player = Player.build("Jon Doe", :kick, :punch, :heal)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        computer: %Player{
          life: 100,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "SkyNet"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "Jon Doe"
        },
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        status: :started,
        computer: %Player{
          life: 100,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "SkyNet"
        },
        player: %Player{
          life: 20,
          moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
          name: "Jon Doe"
        },
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end

  describe "player/0" do
    computer = Player.build("SkyNet", :kick, :punch, :heal)
    player = Player.build("Jon Doe", :kick, :punch, :heal)

    Game.start(computer, player)

    expected_result = %ExMon.Player{
      life: 100,
      moves: %{move_avg: :punch, move_heal: :heal, move_rnd: :kick},
      name: "Jon Doe"
    }

    assert expected_result == Game.player()
  end

  describe "turn/0" do
    computer = Player.build("SkyNet", :kick, :punch, :heal)
    player = Player.build("Jon Doe", :kick, :punch, :heal)

    Game.start(computer, player)

    expected_result = :player

    assert expected_result == Game.turn()

  end
end
