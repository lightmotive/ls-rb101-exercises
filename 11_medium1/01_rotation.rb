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

def rotate_rightmost_elements(array, count)
  return array if count < 2

  rotate_range = -count..-1
  array[rotate_range] = rotate_array(array[rotate_range])

  array
end

def rotate_rightmost_digits(number, count)
  return number if count < 2

  rotate_rightmost_elements(number.to_s.chars, count).join.to_i
end

p rotate_rightmost_digits(735_291, 1) == 735_291
p rotate_rightmost_digits(735_291, 2) == 735_219
p rotate_rightmost_digits(735_291, 3) == 735_912
p rotate_rightmost_digits(735_291, 4) == 732_915
p rotate_rightmost_digits(735_291, 5) == 752_913
p rotate_rightmost_digits(735_291, 6) == 352_917

# Rotation (Part 3)
puts '**Part 3**'

def max_rotation(integer)
  chars = integer.to_s.chars

  chars.size.downto(2) do |rotate_count|
    chars = rotate_rightmost_elements(chars, rotate_count)
  end

  chars.join.to_i
end

p max_rotation(735_291) == 321_579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10_500_000) == 5001
