# frozen_string_literal: true

# **PEDAC for merging two sorted arrays**
# (This is practice to ensure I retained the learnings from the last exercise.)
=begin
*P*
Input: Two sorted arrays
Output: One array containing the elements from both arrays, sorted.

*E*
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

*D*
- Build a new array containing the elements in sorted order.
- Track the second array's current position in a variable.

*A*
Given two arrays, array1 and array2:

- Initialize `merged` and assign to a new array.
- Initialize tracking variable for second array as `index2` and assign to 0.
- Iterate through each element in `array1` as `element1`
  - While `index2` hasn't reached the end AND
    `array2[index2]`` is <= `element1`:
    - Append `array2[index2]` to `merged`.
    - Increment `index2`.
  - Append `element1` to `merged`
- Append everything in `array2` from `index2` to the end; those are values
  that wouldn't pass the `array2[index2] <= element1` above.
- Return `merged`.
=end


# **PEDAC for Merge Sort**
=begin
*P*
Input: Array
Output: Sorted array

Break the array down into nested arrays containing one element each, e.g.:
[9, 5, 7, 1, 3] ->
[[9, 5], [7, 1, 3]] ->
[[[9], [5]], [[7], [1, 3]]] ->
[[[9], [5]], [[7], [[1], [3]]]] ->
...and then merge each array back together:
[[5, 9], [[7], [1, 3]]] ->
[[5, 9], [1, 3, 7]] ->
[1, 3, 5, 7, 9]

*E*
merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == 
  %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == 
  [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

*D*
- Create an array to hold the broken-down array elements.

*A*
This problem can be broken down into two major components:
- A method that merges two sorted arrays (separate PEDAC above).
- A recursive method that splits the array into nested sub-arrays,
  then merges them back together two arrays at a time using the first method.

Given an array:

- 
=end
