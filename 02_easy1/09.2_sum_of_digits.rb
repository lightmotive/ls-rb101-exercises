# frozen_string_literal: true

# Write a method that takes one argument, a positive integer, and returns the
# sum of its digits.

# Input: positive Integer
# Output: positive Integer (sum of digits)

# Algorithm:
# - Split the integer into digits by converting it to a string, getting the
#   chars, and reducing the chars converted to integers into a sum.

def sum(integer)
  integer.to_s.chars.reduce(0) { |sum, num_string| sum + num_string.to_i }
end

p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45
