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

# Examples:

NO_NEXT_FEATURED_NUMBER_MESSAGE = 'There is no subsequent featured number.'

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) == NO_NEXT_FEATURED_NUMBER_MESSAGE
