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
  short5: { input: '', expected_output: '' },
  long1: { input: 'ddaaiillyy ddoouubbllee ' * 500, expected_output: 'daily double ' * 500 }
}.freeze

TEST_DATA.each do |name, data|
  puts "#{name}: #{crunch_regex(data[:input]) == data[:expected_output]}"
end

benchmark_report(5, 500, TEST_DATA,
                 [
                   { label: 'Iteration', method: ->(string) { crunch_iterate(string) } },
                   { label: 'Regex', method: ->(string) { crunch_regex(string) } }
                 ])
