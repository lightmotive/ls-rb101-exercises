# frozen_string_literal: true

def staggered_case(string, start_upcase: true)
  upcase = !start_upcase
  string.chars.map do |char|
    next char if char =~ /[^a-z]/i

    upcase = !upcase
    upcase ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ignore 77 the 444 numbers', start_upcase: false) == 'iGnOrE 77 tHe 444 NuMbErS'
