# frozen_string_literal: true

# **PEDAC**
# *P*
# Input: Array of arrays (matrix)
# Output: The same array, rotated 90 degrees clockwise
# Metal model: To rotate_reverse_ref a matrix 90 degrees, convert each row into columns.
#   The last row becomes the first column, the second to last row becomes the
#   second column, and so on.
#
# *E*
# Tests below implementation...
#
# *D*
# Given any matrix, produce a new matrix (array of arrays). We'll create a new
# array.
#
# *A*
# - Create a new matrix called `rotated` to store the result
# - Iterate through rows in reverse order with row_idx:
#   - Iterate through each element in the row with col_idx:
#     - Add the current element to rotated[col_idx][rotated_col_idx]
#       - rotated_col_idx == -row_idx + matrix.size - 1

# C (Implementation, to be coded with intent)

def rotate_reverse_ref(matrix, rotations = 1)
  rotated = []

  (matrix.size - 1).downto(0) do |row_idx|
    rotated_col_idx = -row_idx + matrix.size - 1

    matrix[row_idx].each_with_index do |element, col_idx|
      rotated[col_idx] = [] if rotated[col_idx].nil?
      rotated[col_idx][rotated_col_idx] = element
    end
  end

  rotations == 1 ? rotated : rotate_reverse_ref(rotated, rotations - 1)
end

# Launch School solution:
# *A*
# Given a matrix:
#
# - Initialize result as an array to contain the rotated matrix
# - Iterate through matrix column indices
#   - Iterate through matrix row indices, mapping the matrix column row by row
#     to new_row.
#   - Append reversed new_row to result.
# - Return result
def rotate_map_reverse(matrix, rotations = 1)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end

    result << new_row.reverse
  end

  rotations == 1 ? result : rotate_map_reverse(result, rotations - 1)
end

# *A*
# Alternative map_reverse that obviates need for row.reverse:
#
# - Initialize result as an array to contain the rotated matrix
# - Iterate through matrix column indices
#   - Iterate through matrix row indices in reverse, mapping the matrix column
#     row by row to new_row.
#   - Append new_row to result.
# - Return result
def rotate_map(matrix, rotations = 1)
  result = []
  reverse_row_index_range = (-(matrix.size - 1)..0)
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    new_row = reverse_row_index_range.map do |row_index|
      matrix[row_index][column_index]
    end

    result << new_row
  end

  rotations == 1 ? result : rotate_map_reverse(result, rotations - 1)
end

require_relative '../../ruby-common/test'
require_relative '../../ruby-common/benchmark_report'

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def matrix_big_create(row_count, column_count)
  (1..row_count).map do
    (1..column_count).map { rand(column_count) }
  end
end
matrix_big = matrix_big_create(100, 150)
matrix_big_rotated = rotate_map(matrix_big)

TESTS = [
  {
    input: [matrix1],
    expected_output: [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
  },
  {
    input: [matrix2],
    expected_output: [[5, 3], [1, 7], [0, 4], [8, 2]]
  },
  {
    input: [matrix2, 4],
    expected_output: matrix2
  },
  {
    input: [matrix_big],
    expected_output: matrix_big_rotated
  }
].freeze

run_tests('rotate_reverse_ref', TESTS, ->(input) { rotate_reverse_ref(*input) })
run_tests('rotate_map_reverse', TESTS, ->(input) { rotate_map_reverse(*input) })
run_tests('rotate_map', TESTS, ->(input) { rotate_map(*input) })

benchmark_report(
  5, 500, TESTS,
  [
    { label: 'reverse_ref', method: ->(input) { rotate_reverse_ref(*input) } },
    { label: 'map_reverse', method: ->(input) { rotate_map_reverse(*input) } },
    { label: 'map', method: ->(input) { rotate_map(*input) } }
  ]
)

# Once again, the idiomatic Ruby approach is slightly faster (1.07x avg) than
# a procedural approach!

# The new rotate_map method is slightly faster than map_reverse most of the
# time. Is it consistently faster with larger arrays?

# With larger arrays, map_reverse is usually faster. That's surprising!
