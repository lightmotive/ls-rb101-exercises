# frozen_string_literal: true

puts "=> What's the name?"
name = gets.strip
name = 'Teddy' if name.empty?

puts "#{name} is #{rand(20..200)} years old!"
