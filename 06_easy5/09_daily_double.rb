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

require_relative '../../ruby-common/benchmark_report'
require_relative '../../ruby-common/test'

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

TESTS = [
  { label: 'short1', input: 'ddaaiillyy  ddoouubbllee', expected_output: 'daily double' },
  { label: 'short2',  input: '4444abcabccba', expected_output: '4abcabcba' },
  { label: 'short3',  input: 'ggggggggggggggg', expected_output: 'g' },
  { label: 'short4',  input: 'a', expected_output: 'a' },
  { label: 'short5',  input: '', expected_output: '' },
  { label: 'long1',   input: ('ddaaiillyy ddoouubbllee ' * 500), expected_output: ('daily double ' * 500) }
].freeze

run_tests('crunch_iterate', TESTS, ->(input) { crunch_iterate(input) })
run_tests('crunch_regex', TESTS, ->(input) { crunch_regex(input) })

benchmark_report(TESTS,
                 [
                   { label: 'Iteration', method: ->(string) { crunch_iterate(string) } },
                   { label: 'Regex', method: ->(string) { crunch_regex(string) } }
                 ], iterations: 500)
