# frozen_string_literal: true

# Basic logic:
# Given an odd number and a CHAR:
# - Determine space_length_max, which is the (number - CHAR length * 3) / 2.
# - Iterate from the max space length to zero:
#   - Generate a line with 3 CHARs separated by the specified number of spaces
#     and centered within a total length of number.
# - Generate the center, which is CHAR duplicated [number] times.
# - Repeat the previous iteration, counting up from 0 to space_length_max.
# - Print the generated lines.

CHAR = '*'

def star_half_line(number, space_length)
  #   - Generate a line with 3 CHARs separated by the specified number of spaces
  #     and centered within a total length of number.
end

def star(number)
  # - Determine space_length_max, which is the (number - char length * 3) / 2.
  # - Iterate from the max space length to zero: star_half_line(number, spaces)
  # - Generate the center, which is CHAR duplicated [number] times.
  # - Repeat the previous iteration, but count up from 0 to space_length_max.
  # - Print the generated lines.
end

puts star(7)
puts star(9)
puts star(15)
