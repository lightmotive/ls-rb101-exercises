# frozen_string_literal: true

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7,
# and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is
# not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3
# appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number
# that is greater than the argument. Return an error message if there is no next featured number.

# *****

# Input: an Integer
# Output: the next "featured number" Integer || error message

# Rules:
# - Featured number attributes: odd number && multiple of 7 && digits occur exactly once each.
# - Return the next featured number.
# - Return error message if the input is >= 9_999_999_999 (because there would be 11 digits,
#   so at least one digit would have to repeat).

# * Algorithm *
# - Find the next odd number that's a multiple of 7.
# - REPEAT incrementing the number by 14
#     Return number if it's `featured?`
#   UNTIL number == MAX_NUMBER
# - Return NO_NEXT_FEATURED_NUMBER_MESSAGE

# Examples:

MAX_NUMBER = 9_999_999_999
NO_NEXT_FEATURED_NUMBER_MESSAGE = 'There is no subsequent featured number.'

def increment?(integer)
  integer.odd? && (integer % 7) == 0
end

def featured?(integer)
  return false unless increment?(integer)

  chars = integer.to_s.chars
  return false unless chars.uniq == chars

  true
end

def max_reached?(integer)
  integer >= MAX_NUMBER
end

def featured(integer)
  return NO_NEXT_FEATURED_NUMBER_MESSAGE if max_reached?(integer)

  original = integer

  integer += 1 until increment?(integer)
  integer += 14 if integer == original
  integer += 14 until max_reached?(integer) || featured?(integer)

  max_reached?(integer) ? NO_NEXT_FEATURED_NUMBER_MESSAGE : integer
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(MAX_NUMBER) == NO_NEXT_FEATURED_NUMBER_MESSAGE
