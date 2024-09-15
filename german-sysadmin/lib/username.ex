defmodule Username do
  def sanitize([]), do: []

  def sanitize([h | t]) do
    char =
      case h do
        ?ß -> ~c"ss"
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> [h]
        _ -> ~c""
      end

    char ++ sanitize(t)
  end
end
