module Interactions
  def self.define_name(player)
    player.is_human ? ask_name(player.id) : "Computer"
  end

  def self.game_over(winner_player)
    STDOUT.puts("GAME OVER - CONGRATULATIONS, #{winner_player.name} !!!")
  end

  def self.draw
    STDOUT.puts("IT SEEMS WE HAVE A DRAW !! - NO WINNERS :)")
  end

  def self.ask_difficulty_level
    STDOUT.puts("What is the difficulty level ? [easy/hard]")
    answer = STDIN.gets.chomp

    valid_answers = %w[easy hard EASY HARD]

    unless valid_answers.include? answer
      STDOUT.puts("Invalid answer. Please, try again !")
      self.ask_difficulty_level
    end

    answer
  end

  def self.welcome
    STDOUT.puts("Hello ! Welcome to The Tic-Tac-Toe Game")
  end

  def self.ask_is_human?(id)
    STDOUT.puts("Is player #{id} a human ? [YES/NO]")
    answer = STDIN.gets.chomp

    positive_answers = %w[Y y yes Yes YES]
    negative_answers = %w[N n no No NO]

    positive = positive_answers.include? answer
    negative = negative_answers.include? answer

    possible = positive || negative

    if not possible
      STDOUT.puts("Invalid answer. Please, try again !")
      return ask_is_human?(id)
    end

    positive
  end

  def self.ask_is_ready?(name)
    STDOUT.puts("Are you ready, #{name} ? [Y/N]")
    answer = STDIN.gets.chomp
  end

  def self.ask_name(id)
    STDOUT.puts("What's the name of Player #{id} ?")
    return STDIN.gets.chomp
  end
end