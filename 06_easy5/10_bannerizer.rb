# frozen_string_literal: true

def box_line(side_char, middle_char, middle_length, padding_length, width_limit: 80)
  padding_length_total = 2 + (padding_length * 2)
  middle_length = width_limit - padding_length_total unless middle_length < width_limit - padding_length_total

  "#{side_char}#{middle_char * (middle_length + (padding_length * 2))}#{side_char}"
end

def message_line(edge_char, padding_length, message, width_limit: 80)
  msg = String.new(message)
  box_width = 2 + (padding_length * 2)
  message_line_width_limit = width_limit - box_width

  message_wrapped = String.new

  loop do
    message_line = msg.slice!(0, message_line_width_limit)
    # Last line:
    if message_line.length < message_line_width_limit && message.length > message_line_width_limit
      message_line << ' ' * (message_line_width_limit - message_line.length)
    end
    # Possible improvement: avoid splitting words (add space to replace what's wrapped)
    message_wrapped << "#{edge_char}#{' ' * padding_length}#{message_line}#{' ' * padding_length}#{edge_char}"
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
