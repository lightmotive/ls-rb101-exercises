# frozen_string_literal: true

# We wrote a method for moving a given number of elements from one array to
# another. We decide to test it on our todo list, but invoking `move` on
# line 11 results in a **SystemStackError**.
#
# What does this error mean and why does it happen?

# Ruby raises the **SystemStackError** exception because the recursive method
# is missing a key component: a condition that stops recursion.
# To fix, immediately return from `move` when `n` equals zero.

# Also, it's good to conventionally indicate that `move` mutates the arguments;
# rename `move` to `move!`.

# Finally, the `n` parameter could communicate intent better with a longer name.
# We'll call it `count` instead.

def move!(count, from_array, to_array)
  return if count.zero? || from_array.empty?

  to_array << from_array.shift
  move!(count - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move!(2, todo, done)

p todo == ['coffee with Tom']
p done == ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
