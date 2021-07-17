# frozen_string_literal: true

# Understand the problem
# - Rules:
#   - Year is greater than 0
#   - Leap years before 1752:
#     - Include all years evenly divisible by 4.
#     - The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752,
#       the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is
#       evenly divisible by 4.
#   - Leap years starting with 1752:
#     - Are evenly divisible by 4
#     - Are evenly divisible by 400
#     - Are not evenly divisible by 100 unless also evenly divisible by 400
#     - One can simplify the rules above as:
#       - Leap years are evenly divisible by 400
#       - Leap years are evenly divisible by 4 when not divisible by 100

def leap_year?(year)
  raise StandardError, 'The year must be greater than 0.' unless year.positive?

  if year > 1752
    (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
  else
    (year % 4).zero?
  end
  # A ternary above would work at the expense of readability.
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240_000) == true
p leap_year?(240_001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
