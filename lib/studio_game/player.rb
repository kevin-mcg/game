class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def boost
    @health += 15
  end

  def drain
    @health -= 10
  end

  def score
    @score = @health + @name.length
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"  
  end
end

if __FILE__ == $0
  player = Player.new("jase")
  puts player.name
  puts player.health
  player.boost
  puts player.health
  player.drain
  puts player.health
end
