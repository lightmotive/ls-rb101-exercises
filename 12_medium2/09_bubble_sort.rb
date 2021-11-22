# frozen_string_literal: true

def bubble_sort!(array)
  loop do
    swapped = false
    0.upto(array.size - 2) do |idx|
      next if array[idx] < array[idx + 1]

      array[idx], array[idx + 1] = array[idx + 1], array[idx]
      swapped = true
    end

    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
bubble_sort!(array)
p array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]
