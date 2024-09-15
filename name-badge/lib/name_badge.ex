defmodule NameBadge do
  def print(id, name, department) do
    badge = "#{name} - #{(department || "OWNER") |> String.upcase()}"

    if id === nil, do: "#{badge}", else: "[#{id}] - #{badge}"
  end
end
