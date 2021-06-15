# frozen_string_literal: true

# Problem statement: Write a method that counts the number of occurrences of each element in a given array.

# Pseudocode

# Given an array of objects
#
# SET occurrences to empty hash
#
# FOR each string in array
#   SET current_symbol to object symbol representation
#   SET count_new to 0
#   SET symbol_count to current_symbol value in occurrences
#   IF symbol_count exists
#     SET count_new = symbol_count
#   ENDIF
#   INCREMENT count_new
#   SET current_symbol value in occurrences to count_new
# ENDFOR

def count_occurrences(array)
  occurrences = {}

  array_ci = array.map(&:downcase)
  array_ci.uniq.each { |e| occurrences[e.to_sym] = array_ci.count(e) }

  occurrences
end

vehicles = %w[
  car car truck car SUV truck
  motorcycle motorcycle car truck
]

occurrences = count_occurrences(vehicles)

occurrences.each { |k, v| puts "#{k} => #{v}" }
