# frozen_string_literal: true

# Basic logic
# - Return true if there are no open or close parens.
# - Start count = 0.
# - Loop through each char:
#   - Add 1 for open and subtract 1 for close.
#   - If the value ever falls below 0, return false.
# - Return true if count == 0.

# More robust logic: check for balance within pairs so these tests pass:
#   - p balanced?('[)]') == false
#   - p balanced?('[(])([)][]') == false
#   - p balanced?("'syntax error...") == false
#   - p balanced?('"syntax complete!"') == true
#   - p balanced?('content ) [other "content"] ( end') == false
# The previous implementation used manual pair tracking (count). A simpler
# solution could use Regex to find matching pairs, remove the matching brackets,
# and repeat until there are no more matching pairs.
#   - If any match within matching pair chars is unbalanced, return false.
#   - Replace the matching pair chars, then continue evaluating.
#   - When matches are empty, check if the string still contains match chars.
#     - If so, return false.
#     - Otherwise, return true.

PAIRS = [%w[( )], %w([ ]), %w[{ }],
         ['\u201C', '\u201D'], ['\u2018', '\u2019'],
         %w[' '], %w[" "]].freeze

def regexp_set_escaped(chars)
  chars.map do |char|
    next "\\#{char}" if %w([ ]).include?(char)

    char
  end
end

# Get [open_chars, close_chars]
def pairs_open_close_partitioned
  chars = PAIRS.flatten
  chars.partition.with_index { |_, idx| idx.even? }
end

PAIR_CHARS_SET_REGEXP =
  Regexp.new("[#{regexp_set_escaped(PAIRS.flatten).join}]")

def pair_char_for_regexp(char)
  return char if char.start_with?('\u')

  Regexp.escape(char)
end

# This method uses Regexp Recursion (\g<0>) to find matching pairs.
# Note: some language Regex implementations use (?R) or (?0).
# See https://www.regular-expressions.info/recurse.html for more details.
def pair_match_regexp_strings
  PAIRS.map do |pair|
    open_char, close_char = pair
    boundary_start = pair_char_for_regexp(open_char)
    content = "(?>[^#{regexp_set_escaped(pair).join}]|(\\g<0>))*"
    boundary_end = pair_char_for_regexp(close_char)
    "#{boundary_start}#{content}#{boundary_end}"
  end
end

def pair_matches_regexp
  Regexp.new("(#{pair_match_regexp_strings.join('|')})")
end

PAIR_MATCHES_REGEXP = pair_matches_regexp

def pair_matches(string)
  string.scan(PAIR_MATCHES_REGEXP).flatten.compact.reject(&:empty?).uniq
end

def balanced?(string)
  loop do
    matches = pair_matches(string)
    break if matches.empty?

    matches.each do |match|
      replacement = match[1..-2]
      return false unless balanced?(replacement)

      string = string.gsub(match, replacement)
    end
  end

  string =~ PAIR_CHARS_SET_REGEXP ? false : true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?(')(Hey!)(') == false
p balanced?('“What ((is)) up”') == true
p balanced?('What {[((is))]} up') == true
p balanced?('What {[((is))] up') == false
p balanced?('What ‘is’ up’') == false
p balanced?('[(hello))])') == false
p balanced?('[(]') == false
p balanced?('[(()(]') == false
p balanced?('([[])]') == false
p balanced?('[(])([)][]') == false
p balanced?("'syntax error...") == false
p balanced?('"syntax correct"') == true
p balanced?('content ) [other "content"] ( end )') == false
p balanced?('content { [other "content"] } end }') == false
p balanced?('content [ (other ( "content") ] end') == false
p balanced?('(What)(What(What))((What)') == false
p balanced?('(What)(What(What))(What)') == true
