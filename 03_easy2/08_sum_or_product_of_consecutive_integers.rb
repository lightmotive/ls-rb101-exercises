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

def prompt(message)
  print ">> #{message} "
end

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

prompt('Please enter an integer greater than 0 that will serve as a maximum:')
max_number = gets.chomp.to_i

prompt("Enter 's' to compute the sum or 'p' to compute the product :")
operation = gets.strip.downcase

puts "The #{operation_display(operation)} of the integers between #{START_NUMBER} and #{max_number} is #{compute(
  START_NUMBER, max_number, operation
)}."
