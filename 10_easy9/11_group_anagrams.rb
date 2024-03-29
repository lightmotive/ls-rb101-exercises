# frozen_string_literal: true

# Logic:
# - Create a hash map:
#   - Key: sorted word
#   - Value: array of anagrams that match sorted word
#   - Loop through each word.
#     - Append the word to hash map's value at [sorted word key]
# - Print the hash values.

def string_sort(string)
  string.chars.sort.join
end

def anagrams(words)
  words.each_with_object(Hash.new { |h, k| h[k] = [] }) do |word, map|
    key = string_sort(word).to_sym
    map[key] << word
  end
end

def print_hash_values(hash)
  hash.each_value { |list| p list }
end

print_hash_values(
  anagrams(%w[demo none tied evil dome mode live
              fowl veil wolf diet vile edit tide
              flow neon])
)
