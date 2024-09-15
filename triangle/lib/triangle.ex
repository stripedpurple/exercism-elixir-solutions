defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c), do: do_kind(a, b, c)

  defp do_kind(a, b, c) when a <= 0 or b <= 0 or c <= 0,
    do: {:error, "all side lengths must be positive"}

  defp do_kind(a, b, c) when not (a + b >= c and b + c >= a and a + c >= b),
    do: {:error, "side lengths violate triangle inequality"}

  defp do_kind(a, b, c) do
    cond do
      a === b and b === c ->
        {:ok, :equilateral}

      a === b or b === c or c === a ->
        {:ok, :isosceles}

      true ->
        {:ok, :scalene}
    end
  end
end
