# frozen_string_literal: true

SQFEET_TO_SQMETERS = 10.7639

puts "Calculate a room's area"

puts "What's the length in meters?"
length = gets.strip.to_f

puts "What's the width in meters?"
width = gets.strip.to_f

area_meters = length * width

puts "The room's area is #{area_meters} square meters (#{area_meters * SQFEET_TO_SQMETERS} square feet)."
