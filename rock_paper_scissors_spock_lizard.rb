VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

@player_score = 0
@computer_score = 0

def keep_score(p, c)
  @player_score += p
  @computer_score += c
end

def end_game
  if @player_score == 5 || @computer_score == 5
    return true
  else
    return false
  end
end

player_choice = ''
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{player_choice}; Computer chose: #{computer_choice}"

  def win?(first, second)
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
  end

  if win?(player_choice, computer_choice)
    keep_score(1, 0)
    puts "You win!"
  elsif win?(computer_choice, player_choice)
    keep_score(0, 1)
    puts "You lose!"
  else
    puts "It's a tie!"
  end

  # puts "Do you want to play again? (y/n)"
  # play_again = gets.chomp
  # break unless play_again.downcase.start_with? 'y'
  break if end_game()
end
puts "Your score was #{@player_score} - #{@computer_score}. Thank you for playing. Have a nice day!"
