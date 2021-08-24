# frozen_string_literal: true

require_relative '../../ruby-common/test'

TESTS = [
  { label: 'alpha', input: 'CamelCase', expected_output: 'cAMELcASE' },
  { label: 'alpha+symbol', input: 'Tonight on XYZ-TV', expected_output: 'tONIGHT ON xyz-tv' }
].freeze

def swapcase_with_regexp(string)
  string.chars.map do |char|
    case char
    when /[a-z]/ then char.upcase
    when /[A-Z]/ then char.downcase
    else char
    end
  end.join
end

run_tests('swapcase_with_regexp', TESTS, ->(input) { swapcase_with_regexp(input) })
