require_relative "lib/player"
require_relative "lib/gallows"

def get_random_word()
  file = File.new("google-10000-english-no-swears.txt")

  selected_lines = File.readlines(file).select { |line| line.length > 5 && line.length < 12}
  return  selected_lines.sample.downcase
end

def hide_word(random_word)
    hidden_word = []
    array_size = random_word.length

    array_size.times do |i|
      hidden_word.push("_ ")
    end

    puts hidden_word.join
end

def manage_game_state(player, random_word, gallows)
  case
  when $incorrect_letter < 7 && Player.class_variable_get(:@@temp_arr) != random_word
    $is_end = false
  when $incorrect_letter == 7 && Player.class_variable_get(:@@temp_arr) != random_word
    $is_end = false
    puts "You're on your last turn! Becareful!"
  when $incorrect_letter < 8 && Player.class_variable_get(:@@temp_arr) == random_word
    $is_end = true
    puts "You won! Well done :D!"
    play_game(player, gallows, random_word)
  when $incorrect_letter == 8 && Player.class_variable_get(:@@temp_arr) != random_word
    $is_end = true
    puts "Sorry, you lost :(..."
    puts " "
    puts "The answer was #{random_word.join}"
    play_game(player, gallows, random_word)    
  end
end

def play_game(player, gallows, random_word)
  while $is_end == false do
    player.guess_letter(random_word)
    gallows.draw_hangman
    manage_game_state(player, random_word, gallows)
  end
end

$incorrect_letter = 0
$is_end = false

random_word = get_random_word().split("").reject {|i| i == "\n"}
player = Player.new("Player")
gallows = Gallows.new
player.make_temp_array(random_word)

hide_word(random_word)
puts " "
gallows.draw_hangman
play_game(player, gallows, random_word)
