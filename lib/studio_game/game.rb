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
