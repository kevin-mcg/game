class Player
  attr_reader :health, :found_treasures
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
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
    @health + points
  end

  def self.from_csv(line_of_csv)
    name, health = line_of_csv.split(",")
    Player.new(name, Integer(health))
  rescue ArgumentError => e
    puts e.message
    Player.new(name)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score #{score}"
  end

  def found_treasure(name, points)
    @found_treasures[name] += points
  end

  def points
    @found_treasures.values.sum
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
