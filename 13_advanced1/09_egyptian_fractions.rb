# frozen_string_literal: true

#
# ** PEDAC: egyptian method **
#
# * P *
# Input: Rational Number
# Output: Array of Unit Fraction denominators that make up the Egyptian Fraction
#   that represents the Input.
# Rules:
# - Assumption: the Rational Number input will always be positive.
# - Math rule: every positive Rational Number can be written as an Egyptian
#   fraction.
# Questions:
# - Do we want to give an option for minimum starting Rational value?
# Mental model:
#   A sum of unique unit fractions starting with a fraction that's smaller than
#   or equal to the input will equal the input Rational Number.

# * E *
# egyptian(Rational(2, 1)) == [1, 2, 3, 6]
# egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
# egyptian(Rational(5, 8)) == [2, 8]

# * D *
# Store each denominator in an Array.

# * A *
# Given a Rational object `rational`:
# unit_fraction_sum = Rational(0, 1)
# denominator = 0
#   (This is the default behavior assuming method doesn't provide an option to
#   specify the starting fraction.)
# denominators = []
# while unit_fraction_sum < rational
#   denominator += 1
#   new_sum = unit_fraction_sum + Rational(1, denominator)
#   if new_sum <= rational
#     unit_fraction_sum = new_sum
#     denominators << denominator
# return denominators

def egyptian(rational)
  unit_fraction_sum = Rational(0, 1)
  denominator = 0
  denominators = []

  while (unit_fraction_sum <=> rational).negative?
    denominator += 1
    new_sum = unit_fraction_sum + Rational(1, denominator)
    if (new_sum <=> rational) < 1
      unit_fraction_sum = new_sum
      denominators << denominator
    end
  end

  denominators
end

p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57_960]
p egyptian(Rational(5, 8)) == [2, 8]

#
# ** PEDAC: egyptian_reverse method **
#
# * P *
# Input: An output from the `egyptian` method.
# Output: A Rational Number.
# Mental model:
#   The input list of denominators with a *1* numerator will add up to the
#   Rational Number output.

# * E *
# egyptian_reverse(egyptian(Rational(1, 2))) == Rational(1, 2)
# egyptian_reverse(egyptian(Rational(3, 4))) == Rational(3, 4)
# egyptian_reverse(egyptian(Rational(39, 20))) == Rational(39, 20)
# egyptian_reverse(egyptian(Rational(127, 130))) == Rational(127, 130)
# egyptian_reverse(egyptian(Rational(5, 7))) == Rational(5, 7)
# egyptian_reverse(egyptian(Rational(1, 1))) == Rational(1, 1)
# egyptian_reverse(egyptian(Rational(2, 1))) == Rational(2, 1)
# egyptian_reverse(egyptian(Rational(3, 1))) == Rational(3, 1)

# * D *
# No data structure required.

# * A *
# Given an array of Egyptian Fraction denominators, return a sum of
# 1/denominator values.

def egyptian_reverse(denominators)
  denominators.reduce(Rational(0, 1)) do |rational, denominator|
    rational + Rational(1, denominator)
  end
end

p egyptian_reverse(egyptian(Rational(1, 2))) == Rational(1, 2)
p egyptian_reverse(egyptian(Rational(3, 4))) == Rational(3, 4)
p egyptian_reverse(egyptian(Rational(39, 20))) == Rational(39, 20)
p egyptian_reverse(egyptian(Rational(127, 130))) == Rational(127, 130)
p egyptian_reverse(egyptian(Rational(5, 7))) == Rational(5, 7)
p egyptian_reverse(egyptian(Rational(1, 1))) == Rational(1, 1)
p egyptian_reverse(egyptian(Rational(2, 1))) == Rational(2, 1)
p egyptian_reverse(egyptian(Rational(3, 1))) == Rational(3, 1)
