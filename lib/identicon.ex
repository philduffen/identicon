defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
  	hex
  	|> Enum.chunk_every(3, 3, :discard)
  	# |> Enum.reverse
  end

  def pick_colour(%Identicon.Image{hex: [r, g, b | _tail ]} = image) do
  	%Identicon.Image{image | colour: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
