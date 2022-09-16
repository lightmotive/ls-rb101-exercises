# frozen_string_literal: true

# Problem statement: find the duplicate number in an array known to have exactly 1 duplicate
# Basic logic: sort array, then iterate and return when current == previous.

require_relative '../../ruby-common/benchmark_report'
require_relative '../../ruby-common/test'

def test_random_array_with_duplicate(element_count)
  array = []
  1.upto(element_count) { |number| array.push(number) }
  test_duplicate_number = array.sample
  array.push(test_duplicate_number)
  array.shuffle!
  [array, test_duplicate_number]
end

test_large100k = { label: 'large100k' }
test_large100k[:input], test_large100k[:expected_output] = test_random_array_with_duplicate(100_000)
test_verylarge1m = { label: 'verylarge1m' }
test_verylarge1m[:input], test_verylarge1m[:expected_output] = test_random_array_with_duplicate(1_000_000)

TESTS = [{ label: 'small1', input: [1, 5, 3, 1], expected_output: 1 },
         { label: 'small2', input: [18, 9, 36, 96, 31, 19, 54, 75, 42, 15,
                                    38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
                                    14, 61, 90, 81, 8, 63, 95, 99, 30, 65,
                                    78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
                                    89, 10, 84, 1, 47, 68, 12, 33, 86, 60,
                                    41, 44, 83, 35, 94, 73, 98, 3, 64, 82,
                                    55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
                                    85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
                                    40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
                                    7,  34, 57, 74, 45, 11, 88, 67,  5, 58], expected_output: 73 },
         test_large100k,
         test_verylarge1m].freeze

# Unsurprisingly, this basic iterative solution was consistently faster than each_with_index with larger data sets.
# With smaller data sets, it was still faster most of the time.
#   Both are very fast with average execution times of 0.054547s vs 0.064502s when including a 100k element test.
#   Both executed in less than a second after adding a 1m element test: average 0.784654s vs 0.936612s.
#   Results would vary depending on processing power. Results above are for an older 3.5 GHz Intel CPU.
# I would choose each_with_index when needing to compare elements positionally like this unless one expected very
# large data sets or consistently high execution volume on a regular basis.
def find_dup_by_iteration(array)
  last_number = nil
  array.sort!.each do |number|
    return last_number if number == last_number

    last_number = number
  end

  nil
end

run_tests('find_dup_by_iteration', TESTS, ->(input) { find_dup_by_iteration(input) })

def find_dup_by_each_with_index(arr)
  sorted = arr.sort
  sorted.each_with_index { |v, i| return v if v == sorted[i - 1] }
end

run_tests('find_dup_by_each_with_index', TESTS, ->(input) { find_dup_by_each_with_index(input) })

# def find_dup_by_tally(array)
#   array.tally.select { |_, v| v == 2 }.keys[0]
# end

# run_tests("find_dup_by_tally", TESTS, ->(input) { find_dup_by_tally(input) })

# def find_dup_by_neighboring_index(array)
#   array.sort!.find { |element| element == array[array.index(element) + 1] }
# end

# run_tests("find_dup_by_neighboring_index", TESTS, ->(input) { find_dup_by_neighboring_index(input) })

# def find_dup_by_count(arr)
#   arr.find { |element| arr.count(element) == 2 }
# end

# run_tests("find_dup_by_count", TESTS, ->(input) { find_dup_by_count(input) })

# def find_dup_by_index(arr)
#   arr.each do |element|
#     return element if arr.rindex(element) != arr.index(element)
#   end
# end

# run_tests("find_dup_by_index", TESTS, ->(input) { find_dup_by_index(input) })

benchmark_report(TESTS,
                 [
                   { label: 'Iteration', method: ->(input) { find_dup_by_iteration(input) } },
                   { label: 'Each with Index', method: ->(input) { find_dup_by_each_with_index(input) } }
                   # The following solutions were significantly slower with initial benchmarks; ordered by performance:
                   #  ,
                   #  { label: 'Tally', method: ->(input) { find_dup_by_tally(input) } },
                   #  { label: 'Neighboring Index', method: ->(input) { find_dup_by_neighboring_index(input) } },
                   #  { label: 'Count', method: ->(input) { find_dup_by_count(input) } },
                   #  { label: 'Index', method: ->(input) { find_dup_by_index(input) } }
                 ], iterations: 10)
