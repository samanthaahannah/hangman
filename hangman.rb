require 'csv'
require 'json'
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
  when player.incorrect_letter < 7 && player.temp_arr != player.random_word
    player.is_end = false
  when player.incorrect_letter == 7 && player.temp_arr != player.random_word
    player.is_end = false
    puts "You're on your last turn! Be careful!"
  when player.incorrect_letter < 8 && player.temp_arr == player.random_word
    player.is_end = true
    puts "You won! Well done, #{player.name} :D!"
    play_game(player, player.random_word, gallows)
  when player.incorrect_letter == 8 && player.temp_arr != player.random_word
    player.is_end = true
    puts "Sorry, you lost :(...", ""
    puts "The answer was #{random_word.join}"
    play_game(player, player.random_word, gallows)    
  end
end

def play_game(player, random_word, gallows)
  while player.is_end == false do
    player.guess_letter(random_word, gallows)
    gallows.draw_hangman(player.incorrect_letter)
    manage_game_state(player, player.random_word, gallows)
  end
end

def reset
  $is_new = true

  temp_arr = []
  incorrect_letter = 0
  is_end = false
  random_word = get_random_word().split("").reject {|i| i == "\n"}

  player = Player.new("Player1", incorrect_letter, random_word, temp_arr, is_end)
  gallows = Gallows.new
  player.get_name(gallows)

  if $is_new == true
    hide_word(random_word)
  end

  puts
  gallows.draw_hangman(player.incorrect_letter)
  play_game(player, player.random_word, gallows)
end

def get_reset_answer
  puts "Would you like to play again? Y/N"
  answer = gets.chomp.downcase

  if answer == "y"
    reset()
  else
  end
end

reset()
get_reset_answer()
