class Player
  def initialize(name)
    @name = name
  end

  def guess_letter(random_word)
    temp_arr = []
    puts " "
    puts "Enter a letter"
    input = gets.chomp.downcase
    puts " "

    if input[/[a-zA-Z]+/] == false && input.length > 1
      puts "Invalid input. Please only enter one letter"
    elsif random_word.include?(input) == true
      puts "This letter is correct!"
      random_word.each do |i| 
        if i == input
          temp_arr.push(input + " ")
        else
          temp_arr.push("_ ")
        end
      end

      puts temp_arr.join
      puts " "
    elsif random_word.include?(input) == false
      puts "Wrong letter"
      puts " "
    end
  end
end