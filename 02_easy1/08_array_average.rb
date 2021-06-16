# frozen_string_literal: true

def average(int_array)
  int_array.sum.to_f / int_array.length
end

puts average([1, 6]) == (1 + 6).to_f / 2
puts average([1, 5, 87, 45, 8, 8]) == (1 + 5 + 87 + 45 + 8 + 8).to_f / 6
puts average([9, 47, 23, 95, 16, 52]) == (9 + 47 + 23 + 95 + 16 + 52).to_f / 6
