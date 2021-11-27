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
  Array.new(3, CHAR).join(' ' * space_length).center(number)
end

def star(number)
  lines = []
  space_length_max = (number - CHAR.length * 3) / 2

  space_length_max.downto(0) { |space_length| lines.push(star_half_line(number, space_length)) }
  lines.push(CHAR * number)
  0.upto(space_length_max) { |space_length| lines.push(star_half_line(number, space_length)) }

  lines
end

puts star(7)
puts star(9)
puts star(15)
