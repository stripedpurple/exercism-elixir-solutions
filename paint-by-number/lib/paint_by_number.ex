defmodule PaintByNumber do
  def palette_bit_size(color_count) when color_count == 0, do: 0 
  def palette_bit_size(color_count) when color_count <= 2, do: 1
  def palette_bit_size(color_count) do
    1 + palette_bit_size(color_count/2)
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    n = palette_bit_size(color_count)
    <<pixel_color_index::size(n), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    sz = palette_bit_size(color_count)
    <<first::size(sz), _::bitstring>> = picture
    first
  end


  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    sz = palette_bit_size(color_count)
    <<_::size(sz), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
