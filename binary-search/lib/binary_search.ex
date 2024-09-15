defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(tuple, target) do
    search(tuple, target, 0, tuple_size(tuple) - 1)
  end

  defp search([], _target, _low, _high), do: :not_found
  defp search(_, _, low, high) when low > high, do: :not_found

  defp search(tuple, target, low, high) do
    mid = div(low + high, 2)
    value = elem(tuple, mid)

    cond do
      value == target -> {:ok, mid}
      value < target -> search(tuple, target, mid + 1, high)
      true -> search(tuple, target, low, mid - 1)
    end
  end
end
