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
