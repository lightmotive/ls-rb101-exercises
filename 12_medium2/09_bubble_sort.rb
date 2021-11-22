# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def bubble_sort!(array)
  last_index_offset = 2

  loop do
    swapped = false

    0.upto(array.size - last_index_offset) do |idx|
      next if array[idx] <= array[idx + 1]

      array[idx], array[idx + 1] = array[idx + 1], array[idx]
      swapped = true
    end

    last_index_offset += 1
    break unless swapped
  end
end
# rubocop:enable Metrics/MethodLength

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
bubble_sort!(array)
p array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]
