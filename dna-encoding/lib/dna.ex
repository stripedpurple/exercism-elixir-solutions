defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
       ?\s -> 0b0000
       ?A -> 0b0001
       ?C -> 0b0010
       ?G -> 0b0100
       ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
       0b0000 -> ?\s
       0b0001 -> ?A
       0b0010 -> ?C
       0b0100 -> ?G
       0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], accumulator), do: accumulator
  defp do_encode([nucleoside | raw_nucleotide], accumulator), do: do_encode(raw_nucleotide, <<accumulator::bitstring,encode_nucleotide(nucleoside)::4>>)

  def decode(dna), do: do_decode(dna, ~c"")
  defp do_decode(<<>>, accumulator), do: accumulator |> reverse
  defp do_decode(<<nucleoside::4, raw_nucleotide::bitstring>>, accumulator), do: do_decode(raw_nucleotide, [decode_nucleotide(nucleoside) | accumulator])

  defp reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])
end
