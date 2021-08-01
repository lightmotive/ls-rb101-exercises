# frozen_string_literal: true

def box_width(padding_length)
  2 + (padding_length * 2)
end

def message_width_limit(width_limit, padding_length)
  width_limit - box_width(padding_length)
end

def box_line(side_char, middle_char, middle_length, padding_length, width_limit)
  box_width = box_width(padding_length)
  middle_length = width_limit - box_width unless middle_length < width_limit - box_width

  "#{side_char}#{middle_char * (middle_length + (padding_length * 2))}#{side_char}"
end

def message_line_normalized_width(message_line, longest_line_width)
  end_of_line_padding = ' ' * (longest_line_width - message_line.length)
  message_line + end_of_line_padding
end

def message_line_format(edge_char, padding_length, message_line, longest_line_width)
  "#{edge_char}#{' ' * padding_length}" \
  "#{message_line_normalized_width(message_line, longest_line_width)}" \
  "#{' ' * padding_length}#{edge_char}"
end

# Split words that might exceed the message width limit
def message_words(message, message_width_limit)
  words = message.split
  words_final = []

  words.each do |word|
    if word.length <= message_width_limit
      words_final << word
    else
      words_final << word.slice!(0, message_width_limit) until word.length.zero?
    end
  end

  words_final
end

def add_space?(line)
  !line.empty?
end

def append_word_to_line?(line, word, message_width_limit)
  return false if word.nil?
  return true if line.empty? && word.length == message_width_limit

  add_length = (add_space?(line) ? 1 : 0) + word.length
  line.length + add_length < message_width_limit
end

# rubocop:disable Metrics/MethodLength
# Build message lines from words array.
def message_lines(words, message_width_limit)
  lines = []
  line = String.new

  until words.empty? && line.empty?
    if append_word_to_line?(line, words[0], message_width_limit)
      line << ((add_space?(line) ? ' ' : '') + words.shift)
    else
      lines << line
      line = String.new
    end
  end

  lines
end
# rubocop:enable Metrics/MethodLength

# Split a message into words, including word splitting when words exceed message width limit.
def split_message(message, width_limit, padding_length)
  message_width_limit = message_width_limit(width_limit, padding_length)
  words = message_words(message, message_width_limit)

  return [''] if words.empty?

  message_lines(words, message_width_limit)
end

# Split a message into lines, then print a box that fits the longest line. Shorter lines are padded to match longest line.
def print_in_box(message, width_limit: 80, padding_length: 1)
  lines = split_message(message, width_limit, padding_length)
  longest_line_width = lines.max { |a, b| a.length <=> b.length }.length
  top_bottom = box_line('+', '-', longest_line_width, padding_length, width_limit)
  spacer = box_line('|', ' ', longest_line_width, padding_length, width_limit)

  puts top_bottom
  puts spacer
  lines.each { |line| puts message_line_format('|', padding_length, line, longest_line_width) }
  puts spacer
  puts top_bottom
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

print_in_box('Chocolate is a perfect food, as wholesome as it is delicious, a beneficent restorer of exhausted ' \
  'power...it is the best friend of those engaged in literary pursuits. --Justus von Liebig')
# +----------------------------------------------------------------------------+
# |                                                                            |
# | Chocolate is a perfect food, as wholesome as it is delicious, a beneficent |
# | restorer of exhausted power...it is the best friend of those engaged in    |
# | literary pursuits. --Justus von Liebig                                     |
# |                                                                            |
# +----------------------------------------------------------------------------+

print_in_box('Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphiokarabomelitokatakechymenoki' \
  'chlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon is a ' \
  "fictional dish mentioned in Aristophanes' comedy Assemblywomen. --https://en.wikipedia.org/wiki/Lop" \
  'adotemachoselachogaleokranioleipsanodrimhypotrimmatosilphiokarabomelitokatakechymenokichlepikossyph' \
  'ophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon')
# +------------------------------------------------------------------------------+
# |                                                                              |
# | Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphiokarabomelitoka |
# | takechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiol |
# | agoiosiraiobaphetraganopterygon is a fictional dish mentioned in             |
# | Aristophanes' comedy Assemblywomen.                                          |
# | --https://en.wikipedia.org/wiki/Lopadotemachoselachogaleokranioleipsanodrimh |
# | ypotrimmatosilphiokarabomelitokatakechymenokichlepikossyphophattoperisterale |
# | ktryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon              |
# |                                                                              |
# +------------------------------------------------------------------------------+
