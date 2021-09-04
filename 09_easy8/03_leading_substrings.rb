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
