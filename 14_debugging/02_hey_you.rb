# frozen_string_literal: true

# String#upcase! is a destructive method, so why does this code print
# *HEY you* instead of *HEY YOU*? Modify the code so that it produces the
# expected output.

def shout_out_to(name)
  # The problem: `name.chars` returns an array of chars. Each char in the array
  # points to a different string object, none of which point to the underlying
  # value in the `name` String object:
  # name.chars.each { |c| c.upcase! }

  # There are at least 2 ways to fix the issue:
  # 1. Simplify by having `name` invoke **String#upcase** directly (usually
  #    best to avoid mutation/side effects).
  # 2. `name = name.chars.map(&:upcase).join`

  # We'll fix this with option 1.

  puts "HEY #{name.upcase}"
end

shout_out_to('you') # expected: 'HEY YOU'
