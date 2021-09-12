# frozen_string_literal: true

def uppercase?(string)
  (string =~ /[a-z]/).nil?
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further exploration:
# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string.
# Would it make sense to return false instead? Why or why not?

# That is a great question!
# Generally, I would consider the library or codebase in which the method resides, then decide with consistency being
# a key main goal. In this case, the Ruby standard library has one method that asks a similar generic question:
# "Does the string contain only certain characters?": String#ascii_only?
# (''.ascii_only?) == true, so I would have uppercase?('') == true, as well.
