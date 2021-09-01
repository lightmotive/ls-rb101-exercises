# frozen_string_literal: true

def multiply_list(array1, array2)
  products = []
  array1.each_with_index { |number, idx| products << (number * array2[idx]) }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
