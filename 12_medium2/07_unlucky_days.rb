# frozen_string_literal: true

# Basic logic
# - Initialize two Date objects.
#   - Create a range from day 1/13 through 12/13 of specified year.
# - Call `select` on range.
#   - First, select month day 13.
#   - Next, select Fridays.

require 'date'

def friday_13th_dates(year)
  date_start = Date.new(year, 1, 13)
  date_end = Date.new(year, 12, 13)

  (date_start..date_end).select { |date| date.mday == 13 }.select(&:friday?)
end

def friday_13th_count(year)
  friday_13th_dates(year).size
end

p friday_13th_count(2015) == 3
p friday_13th_count(1986) == 1
p friday_13th_count(2019) == 2

def months_with_5_fridays(year)
  date_start = Date.new(year, 1, 1)
  date_end = Date.new(year, 12, 31)

  (date_start..date_end).select(&:friday?)
                        .group_by(&:month)
                        .select { |_, dates| dates.size == 5 }
end

def months_with_5_fridays_count(year)
  months_with_5_fridays(year).size
end

p months_with_5_fridays_count(2022) == 4
p months_with_5_fridays_count(1986) == 4
p months_with_5_fridays_count(2049) == 5
