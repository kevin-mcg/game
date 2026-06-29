require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player
    attr_reader :boost_factor

    def initialize(name, health, boost_factor)
      super(name, health)
      @boost_factor = boost_factor
    end

    def boost
      boost_factor.times { super }
    end

    def found_treasure(name, points)
      discounted_points = points / 2.0
      super(name, discounted_points)
    end
  end

  if __FILE__ == $0
    clumsy = ClumsyPlayer.new("klutz", 105, 3)
    # clumsy = ClumsyPlayer.new("klutz")

    clumsy.found_treasure("flute", 50)
    clumsy.found_treasure("flute", 50)
    clumsy.found_treasure("flute", 50)
    clumsy.found_treasure("star", 100)

    clumsy.found_treasures.each do |name, points|
      puts "#{name}: #{points} points"
    end
    puts "#{clumsy.points} total points"
  end
end
