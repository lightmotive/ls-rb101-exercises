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
# - Iterate through the matrix, tracking row and row_index.
#   - Iterate through each column in the current row, tracking column and
#     column_index.
#     - Append the column value to transposed[column_index].
# - Return transposed values, which will be the transposed arrays.

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
