class Player

  attr_accessor :name, :score

  BASE_SCORE = 3

  def initialize(name)
    @name = name
    @score = BASE_SCORE
  end

  def dock_score
    self.score -= 1
  end

  def reset_score
    self.score = 3
  end
end