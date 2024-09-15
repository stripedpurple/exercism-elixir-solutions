defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)
    cond do
      input === "" -> "Fine. Be that way!"
      String.last(input) === "?" and String.upcase(input) === input and String.downcase(input) !== input-> "Calm down, I know what I'm doing!"
      String.upcase(input) === input and String.downcase(input) !== input -> "Whoa, chill out!"
      String.last(input) === "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
