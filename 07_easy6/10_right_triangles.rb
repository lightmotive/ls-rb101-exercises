# frozen_string_literal: true

def triangle(side_length)
  1.upto(side_length) do |length|
    puts ('*' * length).rjust(side_length)
  end
end

triangle(5)
triangle(9)
