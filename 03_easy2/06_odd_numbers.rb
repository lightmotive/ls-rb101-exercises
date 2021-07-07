# frozen_string_literal: true

# Problem statement: Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# Pseudocode
# SET number to 1
#
# WHILE number <= 99
#   PRINT number on a separate line
#   INCREMENT number by 2
# ENDWHILE

number = 1

while number <= 99
  puts number
  number += 2
end
