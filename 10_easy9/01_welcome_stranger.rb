# frozen_string_literal: true

def greetings(name, profession)
  full_name = name.join(' ')
  full_profession = "#{profession[:title]} #{profession[:occupation]}"

  "Hello, #{full_name}! Nice to have a #{full_profession} around."
end

p greetings(%w[John Q Doe], { title: 'Master', occupation: 'Plumber' }) \
            == 'Hello, John Q Doe! Nice to have a Master Plumber around.'
