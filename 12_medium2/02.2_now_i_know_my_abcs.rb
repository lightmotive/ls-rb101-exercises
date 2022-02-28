# frozen_string_literal: true

# A collection of spelling blocks has two letters per block, as shown in this
# list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
#
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once.
#
# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

# ********************************************************
# Re-implement more idiomatic solution with far less code:
# ********************************************************

# Input: String
# Output: Boolean based on verifying that all letter blocks were used only once.

# Rules:
# - Case-insensitive comparison.

# Mental model:
# Given a set of letter pairs, ensure that each pair is used only once within
# the input string.

# * Data structure *
# - Store the letter pairs in a way that Ruby can easily use them for counting
#   letter occurrences in a string. Then, one can analyze the string as-is.

# * Algorithm *
# Overview:
# Create a `BLOCKS` constant stores each letter pair as a string.

# Given a `word`:
# - Convert `word` to uppercase.
# - Return a return value indicating whether a block's letter set occurs no
#   more than once in the string.

BLOCKS = %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM].freeze

def block_word?(word)
  word = word.upcase
  BLOCKS.none? { |letters| word.count(letters) > 1 }
end

# Examples:
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
