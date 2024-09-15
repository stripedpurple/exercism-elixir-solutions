defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b), do: do_compare(a, b)
  defp do_compare(a, a), do: :equal
  defp do_compare([], [_ | _]), do: :sublist
  defp do_compare([_ | _], []), do: :superlist

  defp do_compare(a, b) do
    a_len = length(a)
    b_len = length(b)

    cond do
      a_len === b_len -> :unequal
      a_len > b_len -> (sliding_window(a, b, b_len) && :superlist) || :unequal
      a_len < b_len -> (sliding_window(b, a, a_len) && :sublist) || :unequal
      true -> :unequal
    end
  end

  defp sliding_window(a, b, window_size) do
    Enum.find(0..(length(a) - window_size), fn i ->
      Enum.slice(a, i, window_size) === b
    end)
  end
end
