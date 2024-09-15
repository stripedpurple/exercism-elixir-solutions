defmodule GuessingGame do
  # No Guess
  def compare(_, guess \\ :no_guess)
  def compare(_, guess) when guess == :no_guess do
    "Make a guess"
  end

  # Correct
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end

  # So Close
  def compare(secret_number, guess) when secret_number + 1 == guess or secret_number - 1 == guess do
    "So close"
  end

  # Too High
  def compare(secret_number, guess) when secret_number - guess < -1 do
    "Too high"
  end

  # Too Low
  def compare(secret_number, guess) when secret_number - guess > 1 do
    "Too low"
  end
end
