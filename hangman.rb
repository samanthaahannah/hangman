require_relative "hangman"
require_relative "lib/player"

def get_random_word()
  file = File.new("google-10000-english-no-swears.txt")

  selected_lines = File.readlines(file).select { |line| line.length > 5 && line.length < 12 }
  print selected_lines.sample
end

get_random_word()