defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem), do: {elem, list}

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list), do: do_count(list, 0)
  defp do_count({}, acc), do: acc
  defp do_count({_}, acc), do: do_count({}, acc + 1)
  defp do_count({_, t}, acc), do: do_count(t, acc + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list), do: do_empty?(list)
  defp do_empty?({}), do: true 
  defp do_empty?(_), do: false 

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list), do: do_peek(list)
  defp do_peek({}), do: {:error, :empty_list}
  defp do_peek({x, _}), do: {:ok, x}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list), do: do_tail(list)
  defp do_tail({}), do: {:error, :empty_list} 
  defp do_tail({t}), do: {:ok, t}
  defp do_tail({_, t}), do: {:ok, t}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list), do: do_pop(list)
  defp do_pop({}), do: {:error, :empty_list}
  defp do_pop({h, t}), do: {:ok, h, t}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list), do: do_from_list(list, {})
  defp do_from_list([], acc), do: acc |> reverse
  defp do_from_list([x], acc), do: do_from_list([], {x, acc})
  defp do_from_list([h|t], acc), do: do_from_list(t, {h, acc})

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: do_to_list(list, [])
  defp do_to_list({}, acc), do: acc |> Enum.reverse()
  defp do_to_list({x}, acc), do: do_to_list({}, [x| acc])
  defp do_to_list({h,t}, acc), do: do_to_list(t, [h| acc])

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list), do: do_reverse(list, {})
  defp do_reverse({}, acc), do: acc 
  defp do_reverse({x}, acc), do: do_reverse({}, {x, acc})
  defp do_reverse({h, t}, acc), do: do_reverse(t, {h, acc}) 
end
