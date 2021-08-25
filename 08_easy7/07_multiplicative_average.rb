# frozen_string_literal: true

def multiplicative_average(array)
  return 0 if array.empty?

  array.inject { |product, number| product * number } / array.size.to_f
end

def show_multiplicative_average(array)
  puts format('The result is %<result>.3f', result: multiplicative_average(array))
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
