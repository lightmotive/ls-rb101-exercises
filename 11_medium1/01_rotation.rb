# frozen_string_literal: true

def rotate_array(array)
  array[1..-1].push(array[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(%w[a b c]) == %w[b c a]
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1] # => true
x == [1, 2, 3, 4]                 # => true
