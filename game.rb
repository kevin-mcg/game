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

class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.append(player)
  end

  def roll_die
    rand(1..6)
  end

  def play
    puts "Let's play #{@title}\n\n"
    puts "Before playing:"
    puts @players
    puts ""

    @players.each do |p|
      number_rolled = roll_die
      puts "The number rolled is: #{number_rolled}"

      case number_rolled
      when 1..2
        p.drain
        puts "#{p.name} got drained 😩"
      when 3..4
        puts "#{p.name} got skipped"
      else
        p.boost
        puts "#{p.name} got boosted 😁"
      end
    end


    puts "\nAfter playing:"
    puts @players
  end
end

player_1 = Player.new("finn", 60)
player_2 = Player.new("lucy", 90)
player_3 = Player.new("jase")
player_4 = Player.new("alex", 125)

game = Game.new("Winner Takes All")
game.add_player(player_1)
game.add_player(player_2)
game.add_player(player_3)
game.add_player(player_4)
# game.play


# Bonus game
p1 = Player.new("david", 60)
p2 = Player.new("goliath", 90)

bonus_game = Game.new("War")
bonus_game.add_player(p1)
bonus_game.add_player(p2)
bonus_game.play