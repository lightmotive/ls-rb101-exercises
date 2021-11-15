# frozen_string_literal: true

# Basic logic
# - Determine the percentage three sets of characters:
#   - Lowercase
#   - Uppercase
#   - Other ("neither")
# - Count the total chars.
# - Use String#count with character ranges to count character sets.
#   - Divide those counts by total chars to get percentage, then multiply
#     by 100 to get ratio.
