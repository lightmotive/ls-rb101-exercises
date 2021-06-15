# frozen_string_literal: true

def reverse_words(sentence)
  sentence.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
