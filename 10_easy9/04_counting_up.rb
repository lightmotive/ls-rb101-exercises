# frozen_string_literal: true

# Further exploration: allow negative argument.
# Questions I would ask:
# - With a positive argument, we count UP from 1 to the argument.
#   If negative, should it count DOWN from -1 to the argument, or the argument to -1 (still count UP)?
#   Without additional input, I would default to counting down for a negative argument.
# Either way, I don't think this method is intuitive; I would not write it on my own.
#   Would it be better to have specific methods like Ruby's Integer#upto and #downto?
#   Or would you want another argument that specifies the sequence direction.

require_relative '../../ruby-common/test'
require_relative '../../ruby-common/benchmark_report'

TESTS = [
  { input: 5, expected_output: [1, 2, 3, 4, 5] },
  { input: 3, expected_output: [1, 2, 3] },
  { input: 1, expected_output: [1] },
  { input: 0, expected_output: [] },
  { input: -5, expected_output: [-1, -2, -3, -4, -5] },
  { input: 50_000_000, expected_output: 1.upto(50_000_000).to_a }
].freeze

def sequence_with_splat(end_number)
  end_number.positive? ? [*1..end_number] : [*-1.downto(end_number)]
end

run_tests('splat', TESTS, ->(input) { sequence_with_splat(input) })

def sequence_with_to_a(end_number)
  end_number.positive? ? (1..end_number).to_a : -1.downto(end_number).to_a
end

run_tests('to_a', TESTS, ->(input) { sequence_with_to_a(input) })

benchmark_report(1, 2, TESTS,
                 [
                   { label: 'splat', method: ->(input) { sequence_with_splat(input) } },
                   { label: 'to_a', method: ->(input) { sequence_with_to_a(input) } }
                 ])

# to_a is consistently around 1.06 - 1.15x faster with larger collections. Probably not going to be a bottleneck in a
#   typical Ruby application.
# splat is sometimes faster with small collections.
