# frozen_string_literal: true

require 'date'

def prompt(message)
  print "-> #{message} "
end

prompt('What is your age?')
age = gets.chomp.to_i

prompt('At what age would you like to retire?')
age_retire = gets.chomp.to_i

year_current = Date.today.year
years_to_retirement = age_retire - age

puts "It's #{year_current}. You will retire in #{year_current + years_to_retirement}"
puts "You have only #{years_to_retirement} years of work to go!"
