# frozen_string_literal: true

# ** PEDAC: egyptian method **

# * P *
# Input: Rational Number
# Output: Array of Unit Fraction denominators that make up the Egyptian Fraction
#   that represents the Input.
# Rules:
# - Assumption: the Rational Number input will always be positive.
# - Math rule: every positive Rational Number can be written as an Egyptian
#   fraction.
# Mental model:
#   A series of unique unit fractions will add up to the input Rational Number.

# * E *
# egyptian(Rational(2, 1)) == [1, 2, 3, 6]
# egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# * D *
# ...

# * A *
# ...

# ** PEDAC: egyptian_reverse method **

# * P *
# Input: An output from the `egyptian` method.
# Output: A Rational Number.
# Mental model:
#   The input list of denominators with a *1* numerator will add up to a
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
# ...

# * A *
# ...
