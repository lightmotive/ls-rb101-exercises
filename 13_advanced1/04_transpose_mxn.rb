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

# ** Further exploration for in-place transpose **

def transpose_square!(matrix)
  index_max = matrix.size - 1
  (0..index_max).each do |rx|
    (rx..index_max).each do |cx|
      next if rx == cx

      matrix[rx][cx], matrix[cx][rx] = matrix[cx][rx], matrix[rx][cx]
    end
  end
end

def transpose_non_square!(matrix)
  # Algorithm from https://en.wikipedia.org/wiki/In-place_matrix_transposition#Non-square_matrices:_Following_the_cycles
  # for each length>1 cycle C of the permutation
  #     pick a starting address s in C
  #     let D = data at s
  #     let x = predecessor of s in the cycle
  #     while x ≠ s
  #         move data from x to successor of x
  #         let x = predecessor of x
  #     move data from D to successor of s
end

def transpose!(matrix)
  if matrix.size == matrix[0].size
    transpose_square!(matrix)
  else
    transpose_non_square!(matrix)
  end

  nil
end

matrix = [
  [1, 5, 8, 10],
  [4, 7, 2, 11],
  [3, 9, 6, 12],
  [13, 14, 15, 16]
]
transpose!(matrix)
p matrix == [[1, 4, 3, 13], [5, 7, 9, 14], [8, 2, 6, 15], [10, 11, 12, 16]]

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
  [10, 11, 12],
  [13, 14, 15]
]
transpose!(matrix)
p matrix == [[1, 4, 3, 10, 13], [5, 7, 9, 11, 14], [8, 2, 6, 12, 15]]

matrix = [
  [1, 4, 3, 10, 13],
  [5, 7, 9, 11, 14],
  [8, 2, 6, 12, 15]
]
transpose!(matrix)
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6], [10, 11, 12], [13, 14, 15]]
