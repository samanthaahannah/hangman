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

  def save(string)
  
  end

  def load(string)
    
  end

  def get_incorrect(incorrect_letter = 0)
    @incorrect_letter
  end

  def get_temp_arr(temp_arr = [])
    @temp_arr
  end

  def get_is_end(temp_arr = false)
    @is_end
  end

  def guess_letter(random_word)
    puts "Enter a letter"
    puts " "
    input = gets.chomp.downcase
    puts " "

    case
    when input[/[a-zA-Z]+/] == false && input.length > 1
      puts "Invalid input. Please only enter one letter"
      puts " "
      print @temp_arr.join
      puts " "
      guess_letter(random_word)
    when input.length < 1
      puts "No input. Please enter atleast one letter"
      puts " "
      print @temp_arr.join
      purs " "
      guess_letter(@random_word)
    when @random_word.include?(input) == true && @temp_arr.include?(input) == false
      puts "This letter is correct!"
      @random_word.each_with_index do |item, idx| 
        if item == input
          @temp_arr[idx] = input
        end
      end
      puts " "
      puts @temp_arr.join
      puts " "
    when @random_word.include?(input) == true && @temp_arr.include?(input) == true
      puts "You have already found this letter. Pick another"
      puts " "
      puts @temp_arr.join
      puts " "
      guess_letter(random_word)
    when @random_word.include?(input) == false
      puts "Uh-oh! Wrong letter!"
      puts " "
      puts @temp_arr.join
      puts " "
      @incorrect_letter += 1
    end
  end
end