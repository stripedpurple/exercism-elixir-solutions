defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = abs(:math.sqrt(x**2 + y**2))

    cond do
      distance <= 1 -> 10
      distance <= 5 -> 5
      distance <=10 -> 1
      true -> 0
    end
  end
end
