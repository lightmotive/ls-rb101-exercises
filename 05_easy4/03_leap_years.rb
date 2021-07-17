# frozen_string_literal: true

# Understand the problem
# - Rules:
#   - Year is greater than 0
#   - Leap years:
#     - Are evenly divisible by 4
#     - Are evenly divisible by 400
#     - Are not evenly divisible by 100 unless also evenly divisible by 400
#     - One can simplify the rules above as:
#       - Leap years are evenly divisible by 400
#       - Leap years are evenly divisible by 4 when not divisible by 100

def leap_year?(year)
  raise StandardError, 'The year must be greater than 0.' unless year.positive?

  (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
