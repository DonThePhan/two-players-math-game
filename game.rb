class Game
  
  attr_accessor :player_1, :player_2, :player_1_turn
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @player_1_turn = true
  end
  
  def getNumbers
    first_num = rand(10) + 1
    second_num = rand(10) + 1
    correctAnswer = first_num + second_num

    {first_num: first_num, second_num: second_num, correctAnswer: correctAnswer}
  end

  def self.handleAnswer(answer, correctAnswer, currentPlayer)
    if answer != correctAnswer
      puts "#{currentPlayer.name}: Seriously? No!"
      currentPlayer.dock_score
    else
      puts "YES! You are correct."
    end
  end

  def display_score
    puts "#{self.player_1.name}: #{self.player_1.score}/#{Player::BASE_SCORE} vs #{self.player_2.name}: #{self.player_2.score}/#{Player::BASE_SCORE}"
    puts "----- NEW TURN -----"
  end

  def get_winner 
    self.player_1.score > 0 ? self.player_1 : self.player_2
  end

  def endGame
    puts "#{self.get_winner.name} wins!"
    puts "----- GAME OVER ----"
    puts "Good Bye!"
  end

  def play
    while (self.player_1.score > 0) && (self.player_2.score > 0) do
      currentPlayer = self.player_1_turn ? self.player_1 : self.player_2

      first_num, second_num, correctAnswer = self.getNumbers.values()
    
      puts "#{currentPlayer.name}: what's #{first_num} + #{second_num}?"
      answer = gets.to_i

      self.class.handleAnswer(answer, correctAnswer, currentPlayer)
      self.display_score
      self.player_1_turn = !self.player_1_turn

    end
    
    self.endGame
    
  end
end