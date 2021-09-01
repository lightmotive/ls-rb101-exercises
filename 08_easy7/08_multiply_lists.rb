# frozen_string_literal: true

def multiply_list(array1, array2)
  products = []
  array1.each_with_index { |number, idx| products << (number * array2[idx]) }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiple_list_with_zip(*arrays)
  arrays[0].zip(*arrays[1, arrays.size - 1]).map { |numbers| numbers.inject(:*) }
end

p multiple_list_with_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiple_list_with_zip([3, 5, 7], [9, 10, 11], [12, 13, 14]) == [324, 650, 1078]
