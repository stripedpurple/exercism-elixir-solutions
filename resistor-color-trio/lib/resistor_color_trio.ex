defmodule ResistorColorTrio do
  @colors [:black, :brown, :red, :orange, :yellow, :green, :blue, :violet, :grey, :white]
  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3 | _]),
    do: convert(String.to_integer("#{idx(c1)}#{idx(c2)}") * 10 ** idx(c3))

  defp idx(color), do: Enum.find_index(@colors, &(&1 === color))
  defp convert(total) when total >= @giga, do: {total / @giga, :gigaohms}
  defp convert(total) when total >= @mega, do: {total / @mega, :megaohms}
  defp convert(total) when total >= @kilo, do: {total / @kilo, :kiloohms}
  defp convert(total), do: {total, :ohms}
end
