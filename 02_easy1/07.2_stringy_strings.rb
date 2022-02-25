# frozen_string_literal: true

# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

# Input: Integer
# Output: String

# Rules:
# - Always start with 1.
# - Length of string should match the input Integer.

# Algorithm:
# - Initialize `bit = '1'`
# - Initialize `result = String.new`
# - Iterate from 1 to `count`
#   - Append `bit` to `result`
#   - Flip `bit`

def stringy(count)
  bit = '1'
  result = String.new

  (1..count).each do
    result << bit
    bit = (bit == '1' ? '0' : '1')
  end

  result
end

p stringy(6) == '101010'
p stringy(9) == '101010101'
p stringy(4) == '1010'
p stringy(7) == '1010101'
