# frozen_string_literal: true

# What does this print out? Can you explain the results?

name = String.new('Bob')
save_name = name
# At this point, name and save_name point to the same object (the object_id would be the same).
name.upcase!
# String#upcase! mutates the underlying object.
puts name, save_name
# name and save_name will both be "BOB" because they point to the same (mutated) object.
