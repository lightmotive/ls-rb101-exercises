# frozen_string_literal: true

# ** PEDAC **

# * P *
# Input: matrix array (array of arrays of the same size)
# Output: transposed array
#
# * E *
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
#
# new_matrix = transpose(matrix)
#
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
#
# * D *
# Create a new array of arrays.
#
# * A *
# Given a matrix:
# - Initialize transposed and assign to empty array.
# - Counting from 0 to array size - 1:
#   - Initialize row_transposed to empty array.
#   - Iterate through matrix: (row)
#     - Add the element at row[count] to row_transposed.
#   - Append row_transposed to transposed.
# - Return transposed.

def transpose(matrix)
  transposed = []

  0.upto(matrix.size - 1) do |column_index|
    row_transposed = []
    matrix.each { |row| row_transposed.push(row[column_index]) }
    transposed.push(row_transposed)
  end

  transposed
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
