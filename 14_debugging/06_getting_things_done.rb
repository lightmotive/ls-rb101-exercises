# frozen_string_literal: true

# We wrote a method for moving a given number of elements from one array to
# another. We decide to test it on our todo list, but invoking `move` on
# line 11 results in a **SystemStackError**.
#
# What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo == ['coffee with Tom']
p done == ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
