# frozen_string_literal: true

# Problem statement: Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# Pseudocode:

# number = 1
#
# WHILE number <= 99
#   PRINT number on a separate line if number is even
#   INCREMENT number by 1
# ENDWHILE

number = 1

while number <= 99
  puts number if number.even?
  number += 1
end
