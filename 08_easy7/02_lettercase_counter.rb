# frozen_string_literal: true

def letter_case_count(string)
  count = {}
  count[:lowercase] = string.count('a-z')
  count[:uppercase] = string.count('A-Z')
  count[:neither] = string.count('^a-zA-Z')

  count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
