# frozen_string_literal: true

# ** PEDAC **
# * P *
# - Input: 3 Integers representing triangle angles
# - Output: one symbol indicating the triangle type: :right, :acute, :obtuse,
#   :invalid
#
# - Rules:
#   - Triangle is :invalid if:
#     - Any angle is <= 0.
#     - Sum of all angles != 180.
#   - Other triangle types:
#     - :right: one angle is 90.
#     - :acute: all three angles are less than 90.
#     - :obtuse: one angle is greater than 90.
#   - All angles will be Integers (no need to deal with imprecise floats/BigInt).

# * E *
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# * D *
# - Convert the method arguments to an array (*angles).

# * A *
# Given an array called `angles` that contains 3 Integers:
#
# - Return :invalid if angles includes values <= 0 OR angles sum != 180.
# - Return :right if angles includes 90
# - Return :acute if all angles < 90
# - Return :obtuse if angles includes any value > 90

def triangle(*angles)
  return :invalid if angles.include?(0) || angles.sum != 180

  if angles.include?(90) then :right
  elsif angles.one? { |angle| angle > 90 } then :obtuse
  else :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
