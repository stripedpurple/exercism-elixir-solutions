defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number), do: prime_factors_acc(number, 2, []) |> Enum.reverse()
  defp prime_factors_acc(number, _, factors) when number <= 1, do: factors
  defp prime_factors_acc(number, divisor, factors) when rem(number, divisor) == 0,
    do: prime_factors_acc(div(number, divisor), divisor, [divisor | factors])

  defp prime_factors_acc(number, divisor, factors),
    do: prime_factors_acc(number, divisor + 1, factors)

end
