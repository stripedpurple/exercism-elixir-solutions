defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  defp count([], acc), do: acc
  defp count([_ | tail], acc), do: count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(l, f)
  defp do_map([] = a, _), do: a
  defp do_map([h | t], f), do: [f.(h) | map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([], _, a), do: a |> reverse

  defp filter([h | t], f, a) do
    cond do
      f.(h) -> filter(t, f, [h | a])
      true -> filter(t, f, a)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(list, acc, f), do: do_foldl(list, acc, f)
  defp do_foldl([], acc, _), do: acc
  defp do_foldl([h | t], acc, func), do: foldl(t, func.(h, acc), func)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: l |> reverse |> foldl(acc, f)

  @spec append(list, list) :: list
  def append([h|t], b), do: [h | append(t, b)]
  def append([], b), do: b

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll, [])
  defp do_concat([h|t], a), do: append(h , do_concat(t, a))
  defp do_concat([], a), do: a

end
