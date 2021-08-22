# frozen_string_literal: true

def triangle(side_length, flip_vertical: false, flip_horizontal: true)
  enum = if flip_vertical
           side_length.downto(1)
         else
           1.upto(side_length)
         end

  justification = flip_horizontal ? :rjust : :ljust

  enum.each do |length|
    puts ('*' * length).send(justification, side_length)
  end
end

triangle(5)
triangle(9)
triangle(9, flip_vertical: true)

triangle(5, flip_horizontal: false)
triangle(5, flip_vertical: true)
