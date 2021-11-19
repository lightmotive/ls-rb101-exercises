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

# * A *
