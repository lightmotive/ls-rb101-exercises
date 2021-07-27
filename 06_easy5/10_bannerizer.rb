# frozen_string_literal: true

def box_line(side_char, middle_char, count, padding)
  "#{side_char}#{middle_char * (count + (padding * 2))}#{side_char}"
end

def print_in_box(message)
  length = message.length
  padding = 1
  top_bottom = box_line('+', '-', length, padding)
  spacer = box_line('|', ' ', length, padding)

  puts top_bottom
  puts spacer
  puts "|#{' ' * padding}#{message}#{' ' * padding}|"
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
