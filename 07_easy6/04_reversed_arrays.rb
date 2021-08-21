# frozen_string_literal: true

# Problem Statement:
# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array
# passed into this method. The return value should be the same Array object.

# PEDAC
# =====
# 1. Understand the problem
# ======================
# Input: Array
# Output: The same (mutated) array, reversed
# Mental model: Take the input array, reverse it in place (mutate object in memory), and return it.
#   FYI, it's a bad practice to have a method that mutates and object and returns a value. This is for practice only.
#
# Details:
# - Elements can be of any type.
# - If the array is empty, return an empty array
# - Modify the caller/passed argument/method parameter
#
# 2. Examples/Test Cases
# ======================
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true
#
# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true
#
# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true
#
# list = []
# reverse!(list) == [] # true
# list == [] # true
#
# 3. Data Structure
# =================
# Modify array in-place (without creating a copy)
#
# 4. Algorithm
# ============
# Simply swap array[index] with array[-(index + 1)] until index == (array size / 2) - 1.
# Does it work...
# - if the array has an even number of elements? [1, 2, 3, 4]; swap first two; yes
# - if the array has an odd number of elements? [1, 2, 3]; swap first; yes
# - with 1 element? [1]; swap with itself; yes, but return immediately anyway if size = 1.
# - with 0 elements? []; no: exit and return provided argument immediately
#
# 5. Code (with intent)
# =====================

def reverse!(array)
  return array if array.empty? || array.size == 1

  swap_through_index = (array.size / 2) - 1
  (0..swap_through_index).each do |index|
    swap_index = -(index + 1)
    array[index], array[swap_index] = array[swap_index], array[index]
  end

  array
end

# Unit tests:

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.equal?(result) # true

list = [1, 2, 3]
result = reverse!(list)
p result == [3, 2, 1] # true
p list == [3, 2, 1] # true

list = %w[a b e d c]
p reverse!(list) == %w[c d e b a] # true
p list == %w[c d e b a] # true

list = ['abc']
p reverse!(list) == ['abc'] # true
p list == ['abc'] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
