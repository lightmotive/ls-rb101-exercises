# frozen_string_literal: true

def merge(*arrays)
  arrays.each_with_object([]) do |array, merged|
    array.each { |element| merged << element unless merged.include?(element) }
  end
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]
