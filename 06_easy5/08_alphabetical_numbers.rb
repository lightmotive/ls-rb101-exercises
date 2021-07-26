# frozen_string_literal: true

NUMBERS = %w[zero one two three four
             five six seven eight nine
             ten eleven twelve thirteen fourteen
             fifteen sixteen seventeen eighteen
             nineteen].freeze

def alphabetic_number_sort(number_array)
  number_array.sort { |first, second| NUMBERS[first] <=> NUMBERS[second] }
  # If the comparison values (keysets) are more complex (or performance is less of a concern):
  # number_array.sort_by { |number| NUMBERS[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
