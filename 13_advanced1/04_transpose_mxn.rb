# frozen_string_literal: true

# Algorithm
# Basically, we want to create a new array of items found at the same position
# across all arrays. One could represent that with this kind of data structure:
#
# {
#   0: [arr[0][0], arr[1][0], arr[2][0], ...],
#   1: [arr[0][1], arr[1][1], arr[2][1], ...]
# }
#
# - The first index matches the current matrix row (iterated).
# - The second index matches the current row's column index, serving as the
#   hash key.
#
# Therefore, given a matrix with any dimension, with each array the same size:
#
# - Initialize transposed Hash with default empty array.
# - Iterate through the matrix, tracking row.
#   - Iterate through each column in the current row, tracking column and
#     column_index.
#     - Append the column value to transposed[column_index].
# - Return transposed values, which will be the transposed arrays.

def transpose_hash(matrix)
  transposed = Hash.new { |h, k| h[k] = [] }

  matrix.each do |row|
    row.each_with_index { |col, col_idx| transposed[col_idx].push(col) }
  end

  transposed.values
end

def transpose_map(matrix)
  transposed = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    columns = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    transposed << columns
  end

  transposed
end

require_relative '../../ruby-common/test'
require_relative '../../ruby-common/benchmark_report'

TESTS = [
  { input: [[1, 2, 3, 4]], expected_output: [[1], [2], [3], [4]] },
  {  input: [[1], [2], [3], [4]], expected_output: [[1, 2, 3, 4]] },
  {  input: [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]],
     expected_output: [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]] },
  {  input: [[1]], expected_output: [[1]] }
].freeze

run_tests('transpose_hash', TESTS, ->(input) { transpose_hash(input) })
run_tests('transpose_map', TESTS, ->(input) { transpose_map(input) })

benchmark_report(
  5, 500, TESTS,
  [
    { label: 'hash', method: ->(input) { transpose_hash(input) } },
    { label: 'map', method: ->(input) { transpose_map(input) } }
  ]
)

# Clearly, `map` is 1.65x faster than `hash` on average!

# After replacing the Hash default fixed size Array to unsized Array, `map`
# was still faster by 1.33x on average.
#   A question to explore in the future: when should one use fixed size arrays?
#   - How about with very large arrays?
