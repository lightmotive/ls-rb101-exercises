# frozen_string_literal: true

def prompt(message)
  print "-> #{message}: "
end

def prompt_number(message)
  prompt(message)
  gets.chomp.to_i
end

def track_number(numbers, number)
  numbers.push(number)
end

numbers = []

%w[1st 2nd 3rd 4th 5th].each do |word|
  track_number numbers, prompt_number("Enter the #{word} number")
end
last_number = prompt_number('Enter the last number')

puts "The number #{last_number} #{numbers.include?(last_number) ? 'appears' : 'does not appear'} in #{numbers}."
