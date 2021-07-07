# frozen_string_literal: true

print 'What is your name? '
name = gets.strip

puts name.end_with?('!') ? "HELLO #{name.chop.upcase}! WHY ARE WE SCREAMING?! 8-|" : "Hello #{name} :-)"
