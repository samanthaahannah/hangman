require_relative "lib/player"

def get_random_word()
  file = File.new("google-10000-english-no-swears.txt")

  selected_lines = File.readlines(file).select { |line| line.length > 5 && line.length < 12}
  random_word = selected_lines.sample

  return random_word.split("")
end

def hide_word(random_word)
    hidden_word = []
    array_size = random_word.length

    array_size.times do |i|
      hidden_word.push("_ ")
    end

    puts hidden_word.join
end

hide_word(get_random_word())


