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
def palindrome?(string)
  return false if string.length <= 1

  string == string.reverse
end

def palindromes(string)
  substrings(string).select { |substring| palindrome?(substring) }
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
