# frozen_string_literal: true

# ** PEDAC **
# * P - Understand the problem *
# - Input: 3 integers as separate parameters
# - Output: one of 4 symbols: :equilateral, :isosceles, :scalene, :invalid
#
# - Rules:
#   - The triangle is :invalid if:
#     - Any side is <= 0.
#     - The sum of the 2 shortest side lengths is less than or equal to the
#       longest side.
#   - If the triangle is valid, then these rules apply:
#     - :equilateral if all 3 sides are equal.
#     - :isosceles if 2 sides are equal and third is different
#       - This would have to be the first 2 sides.
#     - :scalene if all 3 sides are different.
# - Questions:
#   - Do we need to check for non-integer or other invalid input like negatives?
#
# - Mental model: If a triangle is valid, then it must be one of 3 types:
#   equilateral, isosceles, or scalene. The type depends on the length
#   comparisons of each side.

# * E - Examples/test cases *
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# * D - Data Structure *
# - Arrange the provided numbers into an array to facilitate sorted comparison.

# * A - Algorithm *
# Given an array of 3 integers called sides:
#
# - Test whether any side is <= 0.
#   - return :invalid
# - Sort sides.
# - If first 2 sides (shortest sides) sum is <= the last side:
#   - return :invalid
# - Count unique elements:
#   - If 1, return :equilateral
#   - If 2, return :isosceles
#   - If 3, return :scalene

def triangle(*sides)
  return :invalid if sides.size != 3 || sides.any? { |side| side <= 0 }

  sides = sides.sort
  first_two_sum = sides[0] + sides[1]
  return :invalid if first_two_sum <= sides.last

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
