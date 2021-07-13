# frozen_string_literal: true

print 'Please type one or more words: '
words = gets.chomp

char_count = words.scan(/\S/).size

def pluralize(word, count)
  # One would probably use a pluralization library here; keeping it simple for now.
  case word
  when 'is'
    count == 1 ? 'is' : 'are'
  else count == 1 ? word : "#{word}s"
  end
end

puts "There #{pluralize('is', char_count)} #{char_count} #{pluralize('character', char_count)} in \"#{words}\"."
