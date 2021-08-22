# frozen_string_literal: true

# Ruby v2.7+ solution
# ===================
# def merge(...)
#   [].union(...)
# end

def merge(*arrays)
  arrays.inject([]) { |merged, array| merged | array }
end

# First solution
# ==============
# def merge(*arrays)
#   arrays.each_with_object([]) do |array, merged|
#     array.each { |element| merged << element unless merged.include?(element) }
#   end
# end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]
