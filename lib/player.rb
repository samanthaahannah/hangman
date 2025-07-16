require 'csv'
require 'json'

class Player
  attr_accessor :name, :incorrect_letter, :random_word, :temp_arr, :is_end

  def initialize(name, incorrect_letter, random_word, temp_arr, is_end)
    @name = name
    @incorrect_letter = incorrect_letter
    @random_word = random_word
    @temp_arr = temp_arr
    @is_end = is_end
  end

  def make_temp_array(random_word)
    array_size = @random_word.length

    array_size.times do |i|
      @temp_arr.push("_ ")
    end
  end

  def save_game
    data = {
      :name => @name,
      :incorrect_letter => @incorrect_letter,
      :random_word => @random_word,
      :temp_arr => @temp_arr,
      :is_end => @is_end
    }

    json_data = JSON.generate(data)

    File.open('bin/saved_game.json', "w") do |file|
      file.write(json_data)
    end
  end

  def load_game
    file_path = 'bin/saved_gane.json'
    if File.exist?(file_path)
      file = File.read(file_path)
      parsed = JSON.parse(file)
      @name = parsed["name"]
      @incorrect_letter = parsed["incorrect_letter"]
      @random_word = parsed["random_word"]
      @temp_arr = parsed["temp_arr"]
      @is_end = parsed["is_end"]
    else
      puts "There is no previous save data"
    end
  end

  def guess_letter(random_word, gallows)
    puts "Enter a letter. Or enter 1 or 2 to 1: save game, or 2: load a previous game", ""
    input = gets.chomp.downcase
    puts " "

    case
    when input[/[a-zA-Z](1|2)+/] == false && input.length > 1
      puts "Invalid input. Please only enter one letter", ""
      print @temp_arr.join
      puts
      guess_letter(random_word, gallows)
    when input.length < 1
      puts "No input. Please enter atleast one letter", ""
      print @temp_arr.join
      puts
      guess_letter(random_word, gallows)
    when input == "1"
      puts "Do you want to save? (Y/N)"
      ans = gets.chomp.downcase
      if ans == "y"
        puts "Saving game"
        save_game
      elsif ans == "n"
        puts "Please type only a letter"
      else
        puts "invalid input"
      end
      puts " "
      print @temp_arr.join
      puts
      guess_letter(random_word, gallows)
    when input == "2"
      puts "Do you want to load a previous save? (Y/N)"
      ans = gets.chomp.downcase
      if ans == "y"
        puts "Loading game"
        load_game
        gallows.draw_hangman(@incorrect_letter)
      elsif ans == "n"
        puts "Please type only a letter"
      else
        puts "invalid input"
      end
      puts
      print @temp_arr.join
      puts
      guess_letter(random_word, gallows)
    when @random_word.include?(input) == true && @temp_arr.include?(input) == false
      puts "This letter is correct!"
      @random_word.each_with_index do |item, idx| 
        if item == input
          @temp_arr[idx] = input
        end
      end
      puts
      puts @temp_arr.join
    when @random_word.include?(input) == true && @temp_arr.include?(input) == true
      puts "You have already found this letter. Pick another", ""
      puts @temp_arr.join
      puts
      guess_letter(random_word, gallows)
    when @random_word.include?(input) == false
      puts "Uh-oh! Wrong letter!", ""
      puts @temp_arr.join
      puts " "
      @incorrect_letter += 1
    end
  end
end