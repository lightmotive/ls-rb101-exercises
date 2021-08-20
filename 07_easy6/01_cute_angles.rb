# frozen_string_literal: true

DEGREE = "\xC2\xB0"
DEGREES = 360
DEGREE_ARC_MOD = 60
SECONDS_PRECISION = 4 # Seconds of arc decimal places

def dms_normalize(degrees, minutes, seconds)
  if seconds.round(SECONDS_PRECISION) == DEGREE_ARC_MOD
    seconds = 0
    minutes += 1
  end
  if minutes == DEGREE_ARC_MOD
    minutes = 0
    degrees += 1
  end
  [degrees, minutes, seconds]
end

def dms_from_decimal(decimal, round: true)
  degrees, minutes_and_seconds = (decimal % DEGREES).divmod(1)
  minutes = minutes_and_seconds * DEGREE_ARC_MOD
  minutes, seconds_fraction = minutes.divmod(1)
  seconds = seconds_fraction * DEGREE_ARC_MOD
  seconds = seconds.round(0) if round

  dms_normalize(degrees, minutes, seconds)
end

def dms(decimal, round: true)
  degrees, minutes, seconds = dms_from_decimal(decimal, round: round)
  template = "%<degrees>d#{DEGREE}%<minutes>02d'%<seconds>" \
             "#{round ? '02d' : "0#{SECONDS_PRECISION + 3}.#{SECONDS_PRECISION}f"}\""

  format(template, degrees: degrees, minutes: minutes, seconds: seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(0°00'00")

# Test results with SECONDS_PRECISION = 4
p dms(30, round: false) == %(30°00'00.0000")
p dms(76.73, round: false) == %(76°43'48.0000")
p dms(254.6, round: false) == %(254°36'00.0000")
p dms(93.034773, round: false) == %(93°02'05.1828")
p dms(127.99999999, round: false) == %(128°00'00.0000")
p dms(127.9999999, round: false) == %(127°59'59.9964")
p dms(0, round: false) == %(0°00'00.0000")
p dms(360, round: false) == %(0°00'00.0000")

# Further exploration: how about values outside the range of 0..360?
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
# Those tests pass without code changes thanks to useful modular math :-)
