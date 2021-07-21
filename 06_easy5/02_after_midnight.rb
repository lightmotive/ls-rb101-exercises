# frozen_string_literal: true

# Logic:
# Exclude whole days to get minutes remaining. A modulo operation will be perfect.
# Integer % MINUTES_PER_DAY = time_minutes
# Divide time_minutes by 60 to get hours (quotient) and minutes (remainder).
# Display hours and minutes on 24-hour clock as "hh:mm" with leading zero for numbers less than 10.

MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60

def hours_and_minutes(minutes)
  minutes.divmod(60)
end

def time_of_day(minutes)
  # Solution using % and divmod
  # hours, minutes = (minutes % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)

  # Solution using Time class
  time = Time.at(minutes * SECONDS_PER_MINUTE)
  time.strftime('%H:%M')
end

p time_of_day(0) == '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'

# Further exploration 3 - assumes UTC-0
def weekday_and_time_of_day(minutes)
  time = Time.new(2021, 7, 18)
  time_offset = time + (minutes * SECONDS_PER_MINUTE)
  time_offset.strftime('%A %H:%M')
end

p weekday_and_time_of_day(-4231) == 'Thursday 01:29'
