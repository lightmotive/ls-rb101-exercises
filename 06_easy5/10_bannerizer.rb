# frozen_string_literal: true

def box_line(side_char, middle_char, count, padding_length)
  "#{side_char}#{middle_char * (count + (padding_length * 2))}#{side_char}"
end

def message_line(edge_char, padding_length, message)
  "#{edge_char}#{' ' * padding_length}#{message}#{' ' * padding_length}#{edge_char}"
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
