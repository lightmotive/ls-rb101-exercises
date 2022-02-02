# frozen_string_literal: true

# Our countdown to launch isn't behaving as expected. Why? Change the code so
# that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  # decrease(counter)
  # The problem is with line 14 above: `counter` is not decremented
  # because of 2 reasons:
  # - `counter`'s value is an Integer, which is immutable.
  # - Even if `counter` was a mutable object, the `decrease` method
  #   doesn't mutate the object; it reassigns it to a decremented value.
  # Changing the line to this will fix the issue:
  counter = decrease(counter)
end

puts 'LAUNCH!'
