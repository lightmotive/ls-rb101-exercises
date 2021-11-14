# frozen_string_literal: true

# PEDAC
# =====
#
# * P *
# Inputs:
# - A single string (word)
# Modifiable constants:
# - A set of mutually exclusive letters ("blocks").
# Outputs:
# - Boolean indicating whether the word can be spelled with the provided blocks.
#
# Rules:
# - Only one letter from each block can be used per word.
# - Case-insensitive.
#
# * E *
# - block_word?('BATCH') == true
# - block_word?('BUTCH') == false
# - block_word?('jest') == true
#
# * D *
# - Store the blocks/letter pairs in a structure the program can access by
#   letter pair, along with a value indicating whether the block has been "used"
#   for a given word.
#
# * A *
# Initialize the set of blocks with the following pairs:
#   B:O   X:K   D:Q   C:P   N:A
#   G:T   R:E   F:S   J:W   H:U
#   V:I   L:Y   Z:M
#
# Given a word and a set of blocks (default blocks if not specified):
# - Loop through each character
#   - Check whether the character exists in a set of blocks where not used.
#     - If yes, mark the block as used and continue.
#     - If no, stop iterating by returning false.
#     - If iteration completes without returning false, return true.

DEFAULT_LETTER_SETS = %w[B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M]

def blocks_create(letter_sets)
  letter_sets.map do |letter_set|
    { letters: letter_set.split(':'), used: false }
  end
end

def blocks_by_letter(letter, blocks)
  letter = letter.upcase
  blocks.select { |block| block[:letters].include?(letter) }
end

def block_used?(block)
  block[:used]
end

def block_use(block)
  block[:used] = true
end

def block_word?(word, blocks = nil)
  blocks = blocks_create(DEFAULT_LETTER_SETS) if blocks.nil?

  word.chars.each do |letter|
    block = blocks_by_letter(letter, blocks).first
    return false if block.nil? || block_used?(block)

    block_use(block)
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
