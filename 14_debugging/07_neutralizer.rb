# frozen_string_literal: true

# We wrote a neutralize method that removes negative words from sentences.
# However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    # The problem: the following line mutates the array during iteration,
    # which causes the iteration to miss the word *boring* after *dull* is
    # deleted.
    # What actually happens, in a nutshell, is this:
    #   - `each` iterates through each word in `words`, passing the word to
    #     the block while keeping track of the current index within the method.
    #     - `each` passes *dull* to the block, which results in executing 
    #       `words.delete('dull')` because `negative?(word)` returns `true`.
    #       - Behind the scenes, `each` is on index 1.
    #       - `words` now looks like this: `%w[These boring cards ...]`;
    #         *boring* is now at the same index at which the just-deleted *dull*
    #         word was before deletion: index 1
    #     - `each` increments the internal index to 2, which points to *cards*
    #       in `words`. That's why *boring* is missed--it's never evaluated due
    #       to the mutation
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
