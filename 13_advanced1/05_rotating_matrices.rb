# frozen_string_literal: true

# **PEDAC**
# *P*
# Input: Array of arrays (matrix)
# Output: The same array, rotated 90 degrees clockwise
# Metal model: To rotate a matrix 90 degrees, convert each row into columns.
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

def rotate90(matrix)
  rotated = []

  (matrix.size - 1).downto(0) do |row_idx|
    rotated_col_idx = -row_idx + matrix.size - 1
    matrix[row_idx].each_with_index do |element, col_idx|
      rotated[col_idx] = [] if rotated[col_idx].nil?
      rotated[col_idx][rotated_col_idx] = element
    end
  end

  rotated
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
