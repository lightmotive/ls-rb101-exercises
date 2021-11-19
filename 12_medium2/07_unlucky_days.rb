# frozen_string_literal: true

# Basic logic
# - Initialize two Date objects.
#   - Create a range from day 1 through 12/31 of specified year.
# - Call `select` on range.
#    - Within `select`, return true when day of month is 13 and day of week
#      is 5.

require 'date'

def friday_13th_dates(year)
  date_start = Date.new(year, 1, 1)
  date_end = Date.new(year, 12, 31)

  (date_start..date_end).select { |date| date.wday == 5 && date.mday == 13 }
end

def friday_13th_count(year)
  friday_13th_dates(year).tap { |dates| p dates }.size
end

p friday_13th_count(2015) == 3
p friday_13th_count(1986) == 1
p friday_13th_count(2019) == 2
