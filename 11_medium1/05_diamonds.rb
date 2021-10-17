# frozen_string_literal: true

# Basic logic
# Given a number that represents the diamond's width:
#
# - Center an asterisk within a length that equals number (empty string fill).
# - Append asterisk rows, increasing by two, until the total asterisks = number.
# - Copy the first half of the diamond minus the last row, reverse, and append.

def diamond_strings(width)
  strings = []
  count = 1

  while count <= width
    strings.push(('*' * count).center(width, ' '))
    count += 2
  end

  strings.concat(strings[0..-2].reverse)
end

def diamond_display(width)
  puts diamond_strings(width)
end

p diamond_strings(1) == ['*']
p diamond_strings(3) == [' * ', '***', ' * ']
p diamond_strings(9) == ['    *    ', '   ***   ', '  *****  ', ' ******* ',
                         '*********', ' ******* ', '  *****  ', '   ***   ',
                         '    *    ']

puts

diamond_display(1)
diamond_display(3)
diamond_display(9)
