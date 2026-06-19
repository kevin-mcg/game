class Game
  
  Treasure = Data.define(:name, :points)

  TREASURES = [
    Treasure.new("pie", 10),
    Treasure.new("coin", 25),
    Treasure.new("flute", 50),
    Treasure.new("compass", 65),
    Treasure.new("key", 80),
    Treasure.new("crown", 90),
    Treasure.new("star", 100)
  ]

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

  def play(round = 1)
    puts "Let's play #{@title}\n\n"
    puts "The treasures to be found are:\n"
    TREASURES.each do |t|
      puts t.name + t.points
    end

    puts "Before playing:"
    puts @players
    puts ""
    
    1.upto(round) do |r| 
      puts "Round: #{r}"
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
    end


    puts "\nAfter playing:"
    puts @players
  end
end
