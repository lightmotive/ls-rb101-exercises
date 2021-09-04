# frozen_string_literal: true

def leading_substrings(string)
  accumulator = String.new
  substrings = []

  string.each_char do |char|
    accumulator += char
    substrings << accumulator
  end

  substrings
end

p leading_substrings('abc') == %w[a ab abc]
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == %w[x xy xyz xyzz xyzzy]

# All Substrings (exercise 4)
puts 'Exercise 4:'
def substrings(string)
  result = []

  string.length.times do |idx|
    substring = string[idx..-1]
    result.concat(leading_substrings(substring))
  end

  result
end

p(substrings('abcde') == %w[
  a ab abc abcd abcde
  b bc bcd bcde
  c cd cde
  d de
  e
])

puts 'Exercise 5:'
IGNORE_OPTIONS_DEFAULT = { case: false, non_alphanumeric: false }.freeze
def palindrome?(string, ignore_options = IGNORE_OPTIONS_DEFAULT)
  string = string.downcase if ignore_options[:case]
  string = string.gsub(/[^a-z]/i, '') if ignore_options[:non_alphanumeric]
  return false if string.length <= 1

  string == string.reverse
end

def palindromes(string, ignore_options: IGNORE_OPTIONS_DEFAULT)
  substrings(string).select { |substring| palindrome?(substring, ignore_options) }
end

p palindromes('abcd') == []
p palindromes('madam') == %w[madam ada]
p palindromes('Madam') == ['ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == %w[
  nittin itti tt ss settes ette tt
]

puts 'Exercise 5 - Further Exploration:'
p palindromes('MadAm', ignore_options: { case: true }) == %w[MadAm adA]
p palindromes('Mad-Am', ignore_options: { non_alphanumeric: true }) == []
p palindromes('mad-am', ignore_options: { non_alphanumeric: true }) == %w[mad-am ad-a]
p palindromes('Mad-Am', ignore_options: { case: true, non_alphanumeric: true }) == %w[Mad-Am ad-A]
