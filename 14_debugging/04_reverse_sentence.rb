# frozen_string_literal: true

# The `reverse_sentence` method should return a new string with the words of
# its argument in reverse order, without using any of Ruby's built-in reverse
# methods. However, the code below raises an error. Change it so that it
# behaves as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    # The problem is with this line:
    # reversed_words = words[i] + reversed_words
    #   `words[i]` returns a String object. **String#+** doesn't accept an
    #   Array-type argument. The line's intent is intuitively clear, but it's
    #   using the wrong syntax.
    # One can rewrite the line like this to fix the problem:
    #   reversed_words = [words[i]] + reversed_words
    # However, it would be more succinct to write this:
    reversed_words.prepend(words[i])
    # **Array#prepend** is an alias to **Array#unshift**.
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
