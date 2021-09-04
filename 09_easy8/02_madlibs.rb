# frozen_string_literal: true

SENTENCES = [
  'They regularly %<verb>s their %<adjective>s %<noun>s %<adverb>s.',
  'He loves to %<verb>s %<adjective>s %<noun>s %<adverb>s!'
].freeze

def madlib_construct(sentence_template, noun, verb, adjective, adverb)
  format(sentence_template, noun: noun, verb: verb, adjective: adjective, adverb: adverb)
end

def user_input(message)
  print "#{message}: "
  gets.chomp
end

noun = user_input('Enter a noun')
verb = user_input('Enter a verb')
adjective = user_input('Enter an adjective')
adverb = user_input('Enter an adverb')

puts madlib_construct(SENTENCES.sample, noun, verb, adjective, adverb)
