class Gallows
  
  def draw_hangman()

    case
    when $incorrect_letter == 0
      puts <<-'EOF'
             
             
             
             
             
             
      =======
      EOF
    when $incorrect_letter == 1
      puts <<-'EOF'
      --+---+
            |
            |
            |
            |
            |
      =======
      EOF
    when $incorrect_letter == 2
      puts <<-'EOF'
      --+---+
        |   |
            |
            |
            |
            |
      =======
      EOF
    when $incorrect_letter == 3
      puts <<-'EOF'
      --+---+
        |   |
        O   |
            |
            |
            |
      =======
      EOF
    when $incorrect_letter == 4
      puts <<-'EOF'
      --+---+
        |   |
        O   |
        |   |
            |
            |
      =======
      EOF
    when $incorrect_letter == 5
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|   |
            |
            |
      =======
      EOF
    when $incorrect_letter == 6
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|\  |
            |
            |
      =======
      EOF
    when $incorrect_letter == 7
      puts <<-'EOF'
      --+---+
        |   |
        O   |
       /|\  |
       /    |
            |
      =======
      EOF
    when $incorrect_letter == 8
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