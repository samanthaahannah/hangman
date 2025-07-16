class Gallows
  
  def draw_hangman(player)

    case
    when player.get_incorrect == 0
      puts <<-'EOF'
             
             
             
             
             
             
      =======
      EOF
    when player.get_incorrect == 1
      puts <<-'EOF'
      --+---+
            |
            |
            |
            |
            |
      =======
      EOF
    when player.get_incorrect == 2
      puts <<-'EOF'
      --+---+
        |   |
            |
            |
            |
            |
      =======
      EOF
    when player.get_incorrect == 3
      puts <<-'EOF'
      --+---+
        |   |
        O   |
            |
            |
            |
      =======
      EOF
    when player.get_incorrect == 4
      puts <<-'EOF'
      --+---+
        |   |
        O   |
        |   |
            |
            |
      =======
      EOF
    when player.get_incorrect == 5
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|   |
            |
            |
      =======
      EOF
    when player.get_incorrect == 6
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|\  |
            |
            |
      =======
      EOF
    when player.get_incorrect == 7
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|\  |
       /    |
            |
      =======
      EOF
    when player.get_incorrect == 8
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|\  |
       / \  |
            |
      =======
      EOF
    end
  end

end