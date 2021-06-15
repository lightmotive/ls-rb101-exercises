# frozen_string_literal: true

# Problem statement: Write a method that counts the number of occurrences of each element in a given array.

# Pseudocode

# Given an array of objects
#
# SET hash_counter to empty hash
#
# FOR each string in array
#   SET current_symbol to object symbol representation
#   SET count_new to 0
#   SET symbol_count to current_symbol value in hash_counter
#   IF symbol_count exists
#     SET count_new = symbol_count
#   ENDIF
#   INCREMENT count_new
#   SET current_symbol value in hash_counter to count_new
# ENDFOR

def count_occurrences(array)
  hash_counter = {}

  array.each do |e|
    current_symbol = e.to_sym
    count_new = hash_counter[current_symbol] || 0
    hash_counter[current_symbol] = count_new + 1
  end

  hash_counter
end

vehicles = %w[
  car car truck car SUV truck
  motorcycle motorcycle car truck
]

p count_occurrences(vehicles)
