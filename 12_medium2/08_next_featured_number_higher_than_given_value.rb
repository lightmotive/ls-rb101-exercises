# frozen_string_literal: true

# Basic logic
# - This problem can be solved with simple iteration and condition evaluation.
#   - Loop to increment the provided number by 1, returning the current number
#     when all of the following number properties are true (check after
#     increment):
#     - Odd
#     - Multiple of 7
#     - All digits are unique
#   - Raise an exception if the number >= 9,999,999,999

def featured(integer)
  integer += 1
  integer += 1 until integer.odd? && (integer % 7).zero?

  loop do
    digit_chars = integer.to_s.chars
    break integer if digit_chars.size == digit_chars.uniq.size

    # Integer#digits is much slower than Integer#to_s:
    #   https://stackoverflow.com/a/47956725/2033465

    integer += 14

    raise StandardError, 'There is no next featured number.' if integer >= 9_876_543_210
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

begin
  featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
rescue StandardError => e
  p e.message == 'There is no next featured number.'
end
