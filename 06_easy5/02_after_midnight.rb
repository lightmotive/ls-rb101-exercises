# frozen_string_literal: true

# Logic:
# Exclude whole days to get minutes remaining. A modulo operation will be perfect.
# Integer % MINUTES_PER_DAY = time_minutes
# Divide time_minutes by 60 to get hours (quotient) and minutes (remainder).
# Display hours and minutes on 24-hour clock as "hh:mm" with leading zero for numbers less than 10.

MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def hours_and_minutes(minutes)
  minutes.divmod(60)
end

def time_of_day(minutes)
  hours, minutes = (minutes % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  format('%<hours>02d:%<minutes>02d', hours: hours, minutes: minutes)
end

p time_of_day(0) == '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'
