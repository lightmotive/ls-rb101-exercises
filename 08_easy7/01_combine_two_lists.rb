# frozen_string_literal: true

require_relative '../../ruby-common/test'

TESTS = [
  { label: 'two arrays', input: [[1, 2, 3], %w[a b c]], expected_output: [1, 'a', 2, 'b', 3, 'c'] },
  { label: 'three arrays', input: [[1, 2, 3], %w[a b c], %i[x y z]],
    expected_output: [1, 'a', :x, 2, 'b', :y, 3, 'c', :z] },
  { label: 'two empty arrays', input: [[], []], expected_output: [] },
  { label: 'three arrays with shorter tail', input: [[1, 2, 3], %w[a b c], %i[x y]],
    expected_output: [1, 'a', :x, 2, 'b', :y, 3, 'c', nil] },
  { label: 'three arrays with shorter head', input: [[1, 2], %w[a b c], %i[x y z]],
    expected_output: [1, 'a', :x, 2, 'b', :y] }
].freeze

def interleave(*arrays)
  interleaved = []
  arrays[0].each_index do |index|
    arrays.each do |array|
      interleaved << array[index]
    end
  end

  interleaved
end

run_tests(TESTS, ->(input) { interleave(*input) })
