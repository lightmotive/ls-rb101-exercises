# frozen_string_literal: true

# Basic logic
# Given a number that represents the diamond's width:
#
# - Center an asterisk within a length that equals number (empty string fill).
# - Append asterisk rows, increasing by two, until the total asterisks = number.
# - Copy the first half of the diamond minus the last row, reverse, and append.

def diamond_string(width, count, outline: false)
  asterisks = if count == 1 then '*'
              elsif outline then "*#{' ' * (count - 2)}*"
              else '*' * count
              end

  asterisks.center(width, ' ')
end

def diamond_strings(width, outline: false)
  strings = []

  1.step(by: 2, to: width) do |count|
    strings.push(diamond_string(width, count, outline: outline))
  end

  strings_before_middle = strings[0..-2]
  strings.concat(strings_before_middle.reverse)
end

def diamond_display(width, outline: false)
  puts diamond_strings(width, outline: outline)
end

p diamond_strings(1) == ['*']
p diamond_strings(1, outline: true) == ['*']
p diamond_strings(3) == [' * ', '***', ' * ']
p diamond_strings(3, outline: true) == [' * ', '* *', ' * ']
p diamond_strings(9) == ['    *    ', '   ***   ', '  *****  ', ' ******* ',
                         '*********', ' ******* ', '  *****  ', '   ***   ',
                         '    *    ']

puts

diamond_display(1)
diamond_display(3)
diamond_display(3, outline: true)
diamond_display(9)
diamond_display(9, outline: true)
