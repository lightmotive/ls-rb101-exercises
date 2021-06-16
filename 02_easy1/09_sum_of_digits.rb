# frozen_string_literal: true

# Problem statement: Write a method that takes one argument, a positive integer, and returns the sum of its digits.
# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def sum(int)
  int.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
