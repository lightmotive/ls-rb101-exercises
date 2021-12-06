# frozen_string_literal: true

def my_method(array)
  if array.empty?
    []
  elsif array.size == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]

# `my_method` has an empty `elsif` as part of the `if` statement. One could
# also interpret that as if Ruby interprets the body of the elsif statement as
# the condition, which will be a truthy value as long as the `array` variable is
# not nil or false. If it were, the program would throw an error. Therefore,
# the program always returns `nil` when a non-empty Array object is provided.
#
# One needs to look at the expected output to determine how to fix the method:
# - When an array with one element is passed in, return 7 * the first element.
# - When an array with multiple elements is passed in, square each array
#   element of the array (transformation).
