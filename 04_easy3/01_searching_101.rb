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

track_number numbers, prompt_number('Enter the 1st number')
track_number numbers, prompt_number('Enter the 2nd number')
track_number numbers, prompt_number('Enter the 3rd number')
track_number numbers, prompt_number('Enter the 4th number')
track_number numbers, prompt_number('Enter the 5th number')

last_number = prompt_number('Enter the last number')

puts "The number #{last_number} #{numbers.include?(last_number) ? 'appears' : 'does not appear'} in #{numbers}."
