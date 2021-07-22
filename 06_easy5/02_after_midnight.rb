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

puts "\n* Further exploration *"

# Further exploration 3 - assumes UTC-0
def weekday_and_time_of_day(minutes)
  time_base_sunday = Time.new(2021, 7, 18)
  time = time_base_sunday + (minutes * SECONDS_PER_MINUTE)
  time.strftime('%A %H:%M')
end

p weekday_and_time_of_day(-4231) == 'Thursday 01:29'

puts "\n* Part 2 *"

# time_string should be in 24-hour format hh:mm
def time_string_to_minutes(time_string)
  hours, minutes = time_string.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR) + minutes
end

# time_string should be in 24-hour format hh:mm
def before_midnight(time_string)
  minutes = time_string_to_minutes(time_string)
  return 0 if minutes.zero?

  MINUTES_PER_DAY - minutes
end

# time_string should be in 24-hour format hh:mm
def after_midnight(time_string)
  minutes = time_string_to_minutes(time_string)
  return 0 if minutes == MINUTES_PER_DAY

  minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
