# frozen_string_literal: true

# Problem statement: Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Pseudocode
# GET an integer as a maximum value
# GET operation with value 's' (sum) or 'p' (product) to determine which operation to perform
#
# CASE operation OF
#   's' : COMPUTE the sum of all numbers between 1 and integer
#   'p' : COMPUTE the product of all numbers between 1 and integer
# ENDCASE
#
# PRINT "The {operation} of the integers between 1 and {integer} is {computed value}."

require_relative '../../ruby-common/validation_error'
require_relative '../../ruby-common/prompt'

def compute(start_number, max_number, operation)
  range = (start_number..max_number)

  case operation
  when 's' then range.sum
  when 'p' then range.reduce(:*)
  end
end

def operation_display(operation)
  case operation
  when 's' then 'sum'
  when 'p' then 'product'
  end
end

START_NUMBER = 1

max_number = prompt_until_valid(
  'Please enter an integer greater than 0 that will serve as a maximum.',
  convert_input: ->(input) { input.to_i },
  validate: ->(integer) { raise StandardError unless integer.positive? }
)

operation = prompt_until_valid(
  "Enter 's' to compute the sum or 'p' to compute the product.",
  get_input: -> { gets.strip },
  convert_input: ->(input) { input.downcase },
  validate: lambda { |input_converted|
              raise StandardError unless %w[s p].include?(input_converted)
            }
)

puts "The #{operation_display(operation)} of the integers between #{START_NUMBER} and #{max_number} is #{compute(
  START_NUMBER, max_number, operation
)}."
