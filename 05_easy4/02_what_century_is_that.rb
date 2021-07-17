# frozen_string_literal: true

# def number_suffix(number)
#   return 'th' if number.between?(4, 20)

#   case number.digits.first
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# def digits_to_integer(digits_array)
#   digits_array.join.to_i
# end

# # Returns array of century and century_tens
# def century_components(year)
#   return [1, 1] if year.between?(1, 100)

#   year_digits = year.digits.reverse
#   century_digits = year_digits.first(year_digits.size - 2)
#   century = digits_to_integer(century_digits)
#   century_tens = digits_to_integer(century_digits.last(2))

#   unless digits_to_integer(year_digits.last(2)).zero?
#     century += 1
#     century_tens += 1
#   end

#   [century, century_tens]
# end

# def century(year)
#   century, century_tens = century_components(year)
#   suffix = number_suffix(century_tens)

#   "#{century}#{suffix}"
# end

# Problem Statement
# Write a method that takes a year as input and returns the century. The return value should be a string that begins
# with the century number, and ends with st, nd, rd, or th as appropriate for that number.
#
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# PEDAC (for practice)
# 1. Understand the problem
#   - Input/Output:
#     - Input: year integer
#     - Output: century string, including the associated ordinal suffix
#   - Requirements/Rules:
#     - Include the ordinal suffix for the century number.
#   - Mental model:
#     - How many centuries have passed in a specified year, and what's the current century?
#       The century begins with the start of the first year.
#     - The ordinal suffixes are 'st' after 1, 'nd' after 2, 'rd' after 3 except for 11, 12, and 13, which end with 'th.
#       'th' follows all other ordinals.
#
# 2. Examples/Test Cases
#   - century(2000) == '20th'
#   - century(2001) == '21st'
#   - century(1965) == '20th'
#   - century(256) == '3rd'
#   - century(5) == '1st'
#   - century(10_103) == '102nd'
#   - century(1052) == '11th'
#   - century(1127) == '12th'
#   - century(11_201) == '113th'
#
# 3. Data Structure
#   - No data structures required.
#
# 4. Algorithm
# High-level:
#   First, count the number of centuries that have passed in the year value (divide year by 100).
#   Next, add 1 to get the current century unless within the first year of the current century (year mod 100 = 0).
#   Calculate the value in the century's 10s place and use the value to logically determine the ordinal suffix.
#     The suffix is 'th' except those ending in 1 (st), 2 (nd), or 3 (rd); an exception to that rule:
#     11, 12, and 13 use the 'th' suffix.
#
# * Sub-procedure: century *
# Given a year
#
# SET century = year / 100
# IF year mod 100 is not zero
#   INCREMENT century
#
# RETURN century
#
# * Sub-procedure: ordinal_suffix *
# Given an integer (as the century)
#
# SET integer_tens to integer mod 100
# IF integer_tens is between 11 and 13
#   RETURN 'th'
# ENDIF
#
# SET last_digit to integer_tens mod 10
# RETURN CASE last_digit OF
#   1 : 'st'
#   2 : 'nd'
#   3 : 'rd'
#   OTHERS:
#     'th'
# ENDCASE
#
# * Sub-procedure: century_formatted *
# Given a year
#
# SET century to (CALL century with year)
# RETURN century converted to string + (CALL ordinal_suffix(century))

# 5. code:

def century(year)
  century = year / 100
  century += 1 unless (year % 100).zero?
  century
end

def ordinal_suffix(integer)
  integer_tens = integer % 100
  return 'th' if integer_tens.between?(11, 13)

  last_digit = integer_tens % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century_formatted(year)
  century = century(year)

  "#{century}#{ordinal_suffix(century)}"
end

p century_formatted(2000) == '20th'
p century_formatted(2001) == '21st'
p century_formatted(1965) == '20th'
p century_formatted(256) == '3rd'
p century_formatted(5) == '1st'
p century_formatted(10_103) == '102nd'
p century_formatted(1052) == '11th'
p century_formatted(1127) == '12th'
p century_formatted(11_201) == '113th'
