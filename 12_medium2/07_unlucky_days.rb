# frozen_string_literal: true

# Basic logic
# - Initialize two Date objects.
#   - Create a range from day 1 through 12/31 of specified year.
# - Call `select` on range.
#    - Within `select`, return true when day of month is 13 and day of week
#      is 5.

def friday_13th_dates(year)
  # - Initialize two Date objects.
  #   - Create a range from day 1 through 12/31 of specified year.
  # - Call `select` on range.
  #    - Within `select`, return true when day of month is 13 and day of week
  #      is 5.
end

def friday_13th_count(year)
  friday_13th_dates(year).size
end

friday_13th_count(2015) == 3
friday_13th_count(1986) == 1
friday_13th_count(2019) == 2
