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

# Input: String
# Output: Boolean

# Rules:
# - Case-insensitive comparison.

# Mental model:
# Given a set of letter pairs, check whether a string can be spelled with no
# more than one letter from each pair.

# * Data structure *
# Store the letter pairs (blocks) in an array of arrays.
# Convert the method parameter to an array of chars.

# * Algorithm *
# Overview:
# Create a constant named `LETTER_BLOCKS` to store letter pairs as array of
# 2-char arrays.

# Given a `word`:
# - Initialize blocks from constant (Object#dup) as `letter_blocks`
# - Iterate through each input char
#   - Find the index of the sub-array containing the matching char.
#     - If not found, return `false`.
#   - Remove the sub-array containing the matching char.
# - Return `true`

# Examples:
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
