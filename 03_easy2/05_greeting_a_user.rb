# frozen_string_literal: true

print 'What is your name? '
name = gets.strip

output = "Hello, #{name}"
puts name.end_with?('!') ? "#{output} Why are we screaming? 8-|".upcase : "#{output} :-)"
