# frozen_string_literal: false

# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w[Moe Larry Curly Shemp Harpo Chico Groucho Zeppo]
array2 = []
array1.each { |value| array2 << value }
# That line adds each value in array1 to array2. The element objects in array2 are identical to those in array1
# (they point to the same objects in memory).
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# String#upcase! mutates the underlying object.
p array2
# => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
# Mutating the strings in array1 affected the values in array2 because they pointed to the same underlying objects.
