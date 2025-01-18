# ExMon - Turn-Based Game in Elixir

## Description

This is a simple turn-based game built in Elixir where the player competes against the computer. Both start with 100 health points, and each turn, they can choose one of three moves to execute. The goal is to reduce the opponent's health to 0 while keeping your health above 0.

---

## Game Rules

1. **Starting Health:**
   - Player: 100 HP
   - Computer: 100 HP

2. **Moves:**
   - **Moderate Attack:** Deals 18-25 damage to the opponent.
   - **Varied Attack:** Deals 10-35 damage to the opponent.
   - **Healing Power:** Restores 18-25 health points to yourself.

3. **Game Flow:**
   - Each turn, the player chooses one move from the three options.
   - The computer randomly selects one of the moves.
   - The game continues until either the player's or the computer's health reaches 0.

4. **Winning Conditions:**
   - If the player's health reaches 0 first, the computer wins.
   - If the computer's health reaches 0 first, the player wins.

---
