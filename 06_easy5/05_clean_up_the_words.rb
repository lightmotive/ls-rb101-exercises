# frozen_string_literal: true

def cleanup(string)
  string.downcase.gsub(/[^a-z]+/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
