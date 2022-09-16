# frozen_string_literal: true

# Lesson learned with further exploration: Ruby's built-in methods can perform much better than custom code.

require_relative '../../ruby-common/benchmark_report'
require_relative '../../ruby-common/test'

TESTS = [
  { label: 'alpha', input: 'CamelCase', expected_output: 'cAMELcASE' },
  { label: 'alpha+symbol', input: 'Tonight on XYZ-TV', expected_output: 'tONIGHT ON xyz-tv' }
].freeze

def swapcase_with_regexp(string)
  string.chars.map! do |char|
    case char
    when /[a-z]/ then char.upcase
    when /[A-Z]/ then char.downcase
    else char
    end
  end.join
end

run_tests('swapcase_with_regexp', TESTS, ->(input) { swapcase_with_regexp(input) })

# A-Z: ASCII 65-90
# a-z: ASCII 97-122
# Upper-to-lower case offset = 32
UPPER_CHAR_RANGE = (65..90).freeze
LOWER_CHAR_RANGE = (97..122).freeze
CHAR_CASE_OFFSET = LOWER_CHAR_RANGE.first - UPPER_CHAR_RANGE.first

def swapcase_with_ord(string)
  string.chars.map!(&:ord).map! do |char_ord|
    case char_ord
    when UPPER_CHAR_RANGE then (char_ord + CHAR_CASE_OFFSET).chr
    when LOWER_CHAR_RANGE then (char_ord - CHAR_CASE_OFFSET).chr
    else char_ord.chr
    end
  end.join
end

run_tests('swapcase_with_ord', TESTS, ->(input) { swapcase_with_ord(input) })

def swapcase_with_ruby(string)
  string.swapcase
end

run_tests('swapcase_with_ruby', TESTS, ->(input) { swapcase_with_ruby(input) })

benchmark_report(TESTS,
                 [
                   { label: 'Mostly Declarative', method: ->(input) { swapcase_with_regexp(input) } },
                   { label: 'Somewhat Imperative', method: ->(input) { swapcase_with_ord(input) } },
                   { label: 'Entirely Declarative', method: ->(input) { swapcase_with_ruby(input) } }
                 ], iterations: 50_000)
