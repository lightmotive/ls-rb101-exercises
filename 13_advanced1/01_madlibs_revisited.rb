# frozen_string_literal: true

# ** PEDAC **

# * P *
# Inputs:
#   - Text file that contains one madlib.
#   - YAML file of random nouns, verbs, adjectives, and adverbs.
# Output:
#   - The text file-sourced madlib from merged with randomly selected nouns,
#     verbs, adjectives, and adverbs from the YAML file.
#
# * E *
# Example text data:
#   The %{adjective} brown %{noun} %{adverb}
#   %{verb} the %{adjective} yellow
#   %{noun}, who %{adverb} %{verb} his
#   %{noun} and looks around.
#
# Example replacement words:
#   - adjectives: quick lazy sleepy ugly
#   - nouns: fox dog head leg
#   - verbs: jumps lifts bites licks
#   - adverb: easily lazily noisily excitedly
#
# Output:
#   The sleepy brown cat noisily
#   licks the sleepy yellow
#   dog, who lazily licks his
#   tail and looks around.
#
# * D *
# - The text file will contain madlib text formatted for use with Ruby's
#   Kernel#format method.
# - The replacement words YAML file will contain a hash object representation
#   with a key for each word type that maps to an array of words of that type.
#   E.g.:
#   adjectives: [quick, lazy, sleepy, ugly]
#   nouns: [fox, dog, head, leg]
#   ...
#
# * A *
# - Read the text file into a string.
# - Read the YAML file into an object to access each type of word.
# - Use Kernel#format to identify the placeholders in the string, then loop
#   through each placeholder.
#   - Select the specified word type using Array#sample.

# NOTE: This solution requires Ruby v2.3+

require 'yaml'

def madlib_random(template, words)
  data = Hash.new do |_, k|
    case k
    when :verb, :noun, :adjective, :adverb
      words["#{k}s"].sample
    else "%<#{k}>s"
    end
  end

  template % data
end

puts madlib_random(
  File.read('01_madlibs_revisited.txt'),
  YAML.load_file('01_madlibs_revisited.yaml')
)
