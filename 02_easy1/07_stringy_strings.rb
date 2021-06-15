# frozen_string_literal: true

# Problem statement: Write a method that takes one argument, a positive integer, and returns a string of alternating
# 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Pseudocode practice

# Given any positive integer

# SET count to 0
# SET string to empty string
# REPEAT
#   INCREMENT count
#   IF count is odd
#     SET string to string plus 1
#   ELSE
#     SET string to string plus 0
#   ENDIF
# UNTIL count == integer

def stringy(int)
  string = String.new
  int.times { |i| string += (i.even? ? '1' : '0') }
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
