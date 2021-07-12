# frozen_string_literal: true

def prompt(message)
  print("-> #{message}: ")
end

def prompt_number(message)
  prompt(message)
  gets.chomp.to_i
end

OPERATIONS = %i[+ - * / % **].freeze

number1 = prompt_number('Enter the first number')
number2 = prompt_number('Enter the second number')

OPERATIONS.each do |operation|
  puts "#{number1} #{operation} #{number2} = #{number1.send(operation, number2)}"
end
