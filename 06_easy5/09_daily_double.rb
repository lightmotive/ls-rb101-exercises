# frozen_string_literal: true

# Logic & pseudocode
# Remove all duplicate sequential characters from a string.

# Given a string
# SET last_char = nothing
# SET deduplicated_string = new mutable string
#
# FOR each character in string
#   IF character != last_char
#     deduplicated_string << character
#     last_char = character
#   ENDIF
# ENDFOR
#
# RETURN deduplicated_string

require 'benchmark'

def crunch_iterate(string)
  last_char = nil
  deduplicated_string = String.new

  string.each_char do |char|
    if char != last_char
      deduplicated_string << char
      last_char = char
    end
  end

  deduplicated_string
end

# Another solution using a fairly simple regular expression with a backreference
def crunch_regex(string)
  string.gsub(/(.)\1+/, '\1')
end

TEST_DATA = {
  short1: { input: 'ddaaiillyy  ddoouubbllee', expected_output: 'daily double' },
  short2: { input: '4444abcabccba', expected_output: '4abcabcba' },
  short3: { input: 'ggggggggggggggg', expected_output: 'g' },
  short4: { input: 'a', expected_output: 'a' },
  short5: { input: '', expected_output: '' }
}.freeze

TEST_DATA.each do |name, data|
  puts "#{name}: #{crunch_regex(data[:input]) == data[:expected_output]}"
end

# Refactor the following into a reusable class that can accept any number of implementations:
benchmark_count = 5
iteration_count = 50_000
puts "\nWhich one is faster_time with #{iteration_count} iterations?"

IMPLEMENTATIONS = [
  { label: 'Iteration', method: ->(string) { crunch_iterate(string) } },
  { label: 'Regex', method: ->(string) { crunch_regex(string) } }
].freeze

benchmark_count.times do
  Benchmark.bm do |benchmark|
    IMPLEMENTATIONS.each do |implementation|
      implementation.default = 0.0
      implementation[:total_seconds] += benchmark.report(implementation[:label]) do
        iteration_count.times do
          TEST_DATA.each do |_, data|
            implementation[:method].call(data[:input])
          end
        end
      end.total
    end
  end
end

def build_details(implementation, benchmark_count)
  details = { label: implementation[:label], total_seconds: 0.0, average_seconds: 0.0 }

  details[:total_seconds] = implementation[:total_seconds]
  details[:average_seconds] = implementation[:total_seconds] / benchmark_count.to_f

  details
end

def calculate_speed_difference(faster_details, slower_details)
  faster_average = faster_details[:average_seconds]
  slower_average = slower_details[:average_seconds]

  (slower_average - faster_average) / slower_average
end

def report_top_two(implementations, benchmark_count)
  sorted_by_total = implementations.sort_by { |implementation| implementation[:total_seconds] }
  first = build_details(sorted_by_total[0], benchmark_count)
  second = build_details(sorted_by_total[1], benchmark_count)

  puts format('%<faster_implementation_label>s was faster than %<slower_implementation_label>s by about %<speed_difference>.0f%% (%<first_time>.4fs vs %<second_time>.4fs).',
              faster_implementation_label: first[:label],
              slower_implementation_label: second[:label],
              first_time: first[:average_seconds],
              second_time: second[:average_seconds],
              speed_difference: calculate_speed_difference(first, second) * 100)
end

report_top_two(IMPLEMENTATIONS, benchmark_count)
