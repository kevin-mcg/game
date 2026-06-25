require_relative "treasure_trove"

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

  def print_stats
    puts "\n#{@title} Game Stats:"
    puts "-" * 30

    puts sorted_players

    @players.each do |player|
      puts "\n#{player.name}'s treasure point totals:"
      player.found_treasures.each do |name, points|
        puts "#{name}: #{points}"
      end
      puts "total: #{player.points}"
    end

    puts "\nHigh Scores:"
    sorted_players.each do |player|
      name = player.name.ljust(20, ".")
      points = player.score.round.to_s.rjust(5)
      puts "#{name}#{points}"
    end
  end

  def sorted_players
    @players.sort_by {|p| p.score}.reverse
  end

  def play(round = 1)
    puts "Let's play #{@title}\n\n"
    puts "\nThe treasures to be found are:\n"
    TreasureTrove::TREASURES.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end

    puts "\nBefore playing:"
    puts @players
    puts ""
    
    1.upto(round) do |r| 
      puts "Round: #{r}"
      @players.each do |p|
        number_rolled = roll_die
        treasure_found = TreasureTrove.random_treasure
        p.found_treasure(treasure_found.name, treasure_found.points)
        puts "The number rolled is: #{number_rolled}"

        case number_rolled
        when 1..2
          p.drain
          puts "#{p.name} got drained 😩"
          puts "#{p.name} found a #{treasure_found.name} worth #{treasure_found.points} points"
        when 3..4
          puts "#{p.name} got skipped"
          puts "#{p.name} found a #{treasure_found.name} worth #{treasure_found.points} points"
        else
          p.boost
          puts "#{p.name} got boosted 😁"
          puts "#{p.name} found a #{treasure_found.name} worth #{treasure_found.points} points"
        end
      end
    end


    puts "\nAfter playing:"
    puts @players
  end
end
