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

# Further exploration

def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string('abcdef') == 'bcdefa'

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

p rotate_integer(12_345) == 23_451
