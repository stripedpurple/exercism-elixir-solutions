defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/

  def split_line(line), do: String.split(line, ~r/\<[\*\~\-\=]*\>/)

  def remove_artifacts(line), do: String.replace(line, ~r/end-of-line\d+/i, "", global: true)

  def tag_with_user_name(line) do
    matches = Regex.run(~r/User\s*(\S*)/u, line)

    cond do
      matches === nil -> line
      true -> "[USER] #{Enum.at(matches, 1)} #{line}"
    end
  end
end
