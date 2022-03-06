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

def substrings_with_slice(s)
  0.upto(s.length - 1).flat_map do |start|
    1.upto(s.length - start).map do |length|
      s[start, length]
    end
  end
end

# `substrings_with_slice` is much clearer, but it's 10% slower than
# `substrings_with_range`, probably due to the flatten operation.

require_relative '../../ruby-common/benchmark_report'
require_relative '../../ruby-common/test'

TESTS = [
  { input: 'testing',
    expected_output: %w[t te tes test testi testin testing e es est esti estin esting
                        s st sti stin sting t ti tin ting i in ing n ng g] }
].freeze

run_tests('range', TESTS, ->(input) { substrings_with_range(input) })
run_tests('slice', TESTS, ->(input) { substrings_with_slice(input) })

benchmark_report(5, 1000, TESTS,
                 [
                   { label: 'range', method: ->(input) { substrings_with_range(input) } },
                   { label: 'slice', method: ->(input) { substrings_with_slice(input) } }
                 ])
