# frozen_string_literal: true

def padding_length_total(padding_length)
  2 + (padding_length * 2)
end

def box_line(side_char, middle_char, middle_length, padding_length, width_limit: 80)
  padding_length_total = padding_length_total(padding_length)
  middle_length = width_limit - padding_length_total unless middle_length < width_limit - padding_length_total

  "#{side_char}#{middle_char * (middle_length + (padding_length * 2))}#{side_char}"
end

def message_line_slice!(message_current, message_original, message_line_width_limit)
  message_line = message_current.slice!(0, message_line_width_limit)
  # Possible improvement: avoid splitting words (add space to replace what's wrapped)

  # Add space if last line:
  if message_line.length < message_line_width_limit && message_original.length > message_line_width_limit
    message_line << ' ' * (message_line_width_limit - message_line.length)
  end

  message_line
end

def message_line_format(edge_char, padding_length, message_current, message_original, width_limit)
  padding_length_total = padding_length_total(padding_length)
  message_line_width_limit = width_limit - padding_length_total

  "#{edge_char}#{' ' * padding_length}" \
  "#{message_line_slice!(message_current, message_original, message_line_width_limit)}" \
  "#{' ' * padding_length}#{edge_char}"
end

def message_line(edge_char, padding_length, message, width_limit: 80)
  msg = String.new(message)
  message_wrapped = String.new

  loop do
    message_wrapped << message_line_format(edge_char, padding_length, msg, message, width_limit)
    break if msg.length.zero?

    message_wrapped << "\n"
  end

  message_wrapped
end

def print_in_box(message)
  length = message.length
  padding_length = 1
  top_bottom = box_line('+', '-', length, padding_length)
  spacer = box_line('|', ' ', length, padding_length)

  puts top_bottom
  puts spacer
  puts message_line('|', padding_length, message)
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
