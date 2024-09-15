defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand), do: (10 ** (log10(radicand) / 2)) |> round
  def log10(x), do: :math.log(x) / :math.log(10)









defp f(x), do:
	 x**2 - 2   # f(x) = x^2 - 2

defp f_prime(x), do:
	 2*x        # f'(x) = 2x

   @doc """Newton's method

    Args:
      x0:              The initial guess
      f:               The function whose root we are trying to find
      f_prime:         The derivative of the function
      tolerance:       Stop when iterations change by less than this
      epsilon:         Do not divide by a number smaller than this
      max_iterations:  The maximum number of iterations to compute
    """
defp newtons_method(x0, f, f_prime, tolerance, epsilon, max_iterations), do:
    Enum.reduce(0..max_iterations, x0, fn _, x ->
    y = f.(x)
    y_prime = f_prime.(x)

    if abs(y_prime) < epsilon do
      nil
    else
      x1 = x - y / y_prime

      if abs(x1 - x) <= tolerance do
        x1
      else
        x1
      end
    end
  end)
end
