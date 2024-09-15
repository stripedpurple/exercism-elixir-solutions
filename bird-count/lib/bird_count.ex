defmodule BirdCount do
  def today([]), do: nil

  def today([head]), do: head

  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]

  def increment_day_count([head]), do: [head + 1]

  def increment_day_count([head| tail]), do: [head + 1| tail]

  def has_day_without_birds?(list), do: 0 in list
  
  defp fold([], acc, _), do: acc 
  
  defp fold([h | t], acc, func), do: fold(t, func.(h, acc), func)

  def total([]), do: 0

  def total(list), do: fold(list, 0, &(&1 + &2))

  def busy_days(list), do: fold(list, 0, &(if &1 >= 5 do 1 + &2 else &2 end))
end
