# frozen_string_literal: true

# Pseudocode (for practice):

# Given string_to_print and print_count

# SET count to 0
#
# REPEAT
#   PRINT string_to_print
#   INCREMENT count
# UNTIL count equals print_count

def repeat(string_to_print, print_count)
  count = 0
  loop do
    puts string_to_print
    count += 1
    break if count == print_count
  end

  # One could replace the imperative code above with the declarative Integer#times method:
  # print_count.times { puts string_to_print }
end

repeat('Eat chocolate', 3)
