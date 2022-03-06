# frozen_string_literal: true

def substrings_with_range(string)
  result = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      result << string[start_idx..end_idx]
    end
  end

  result
end

def substrings_with_slice(string)
  result = []

  0.upto(string.length - 1).each do |start|
    1.upto(string.length - start).each do |length|
      result << string[start, length]
    end
  end

  result
end

# `slice` is the fastest: consistently 20-30% faster than `map_slice`.
# It's also easier to reason about than using a range.

def substrings_with_map_slice(string)
  0.upto(string.length - 1).flat_map do |start|
    1.upto(string.length - start).map do |length|
      string[start, length]
    end
  end
end

# `map_slice` has less code, but a 20-30% performance penalty.
# It's a more functional approach, but it's not easier to wrap one's head
# around. The encapsulated object-oriented approach seems to make more sense
# than a functional approach in this case.
# compared to `substrings_with_range`, probably due to the mapping operations.

def substrings_with_inject_slice(string)
  (0..string.length).inject([]) do |result_outer, start|
    (1..string.length - start).inject(result_outer) do |result, length|
      result << string[start, length]
    end
  end
end

# `inject_slice` eliminates the `flat_map` and `map` overhead, but it's not
# as easy to follow because one must pass the memo object down through the
# layers. It's also sometimes slower than `slice`.

require_relative '../../ruby-common/benchmark_report'
require_relative '../../ruby-common/test'

TESTS = [
  { input: 'testing',
    expected_output: %w[t te tes test testi testin testing e es est esti estin esting
                        s st sti stin sting t ti tin ting i in ing n ng g] }
].freeze

run_tests('range', TESTS, ->(input) { substrings_with_range(input) })
run_tests('slice', TESTS, ->(input) { substrings_with_slice(input) })
run_tests('map_slice', TESTS, ->(input) { substrings_with_map_slice(input) })
run_tests('inject_slice', TESTS, ->(input) { substrings_with_inject_slice(input) })

benchmark_report(5, 1000, TESTS,
                 [
                   { label: 'range', method: ->(input) { substrings_with_range(input) } },
                   { label: 'slice', method: ->(input) { substrings_with_slice(input) } },
                   { label: 'map_slice', method: ->(input) { substrings_with_map_slice(input) } },
                   { label: 'inject_slice', method: ->(input) { substrings_with_inject_slice(input) } }
                 ])
