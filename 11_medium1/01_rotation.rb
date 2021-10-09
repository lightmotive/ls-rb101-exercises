# frozen_string_literal: true

def rotate_array(array)
  array[1..-1].push(array[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(%w[a b c]) == %w[b c a]
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1] # => true
p x == [1, 2, 3, 4] # => true

# Further exploration
puts '**Further Exploration (Part 1)**'

def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string('abcdef') == 'bcdefa'

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

p rotate_integer(12_345) == 23_451

# Rotation (Part 2)
puts '**Part 2**'

def rotate_rightmost_digits(number, count)
  digits = number.to_s.chars
  rotate_range = -count..-1
  digits[rotate_range] = rotate_array(digits[rotate_range])
  digits.join.to_i
end

p rotate_rightmost_digits(735_291, 1) == 735_291
p rotate_rightmost_digits(735_291, 2) == 735_219
p rotate_rightmost_digits(735_291, 3) == 735_912
p rotate_rightmost_digits(735_291, 4) == 732_915
p rotate_rightmost_digits(735_291, 5) == 752_913
p rotate_rightmost_digits(735_291, 6) == 352_917
