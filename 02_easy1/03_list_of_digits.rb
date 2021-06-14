# frozen_string_literal: true

# Problem statement: Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# PEDAC (practice; otherwise, this would be overkill)
# Understand the problem:
#   - IO:
#     - Input: positive integer
#     - Output: list of digits
#   - Rules:
#     - Number is a positive Integer
#   - Mental model: Extract an array of the digits in any positive integer.
#
# Examples/test cases:
#   - 12345 => [1, 2, 3, 4, 5]
#   - 7 => [7]
#   - 375290 => [3, 7, 5, 2, 9, 0]
#   - 444 => [4, 4, 4]
#
# Data structure:
#   - Use an array to store digits.
#
# Algorithm:
#   - Pseudocode (imperative):
#     Given a positive integer...
#
#     SET digits to empty array
#     SET quotient to integer
#     REPEAT
#       SET quotient and modulus to the results of dividing quotient by 10
#       SET first position of digits to modulus
#     UNTIL quotient is zero
#
#     RETURN digits
#
# Code:

def digit_list(integer)
  digits = []
  quotient = integer

  return digits if integer.nil?

  loop do
    quotient, modulus = quotient.divmod(10)
    digits.unshift(modulus)
    break if quotient.zero?
  end

  digits

  # One could also declaratively convert the number to a string, split it, and then map the char array with to_i:
  # number.to_s.chars.map(&:to_i)
end

p digit_list(12_345) == [1, 2, 3, 4, 5]
p digit_list(7) == [7]
p digit_list(375_290) == [3, 7, 5, 2, 9, 0]
p digit_list(444) == [4, 4, 4]
p digit_list(nil) == []
