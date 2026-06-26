require_relative "lib/studio_game/game"
require_relative "lib/studio_game/player"

# player_1 = Player.new("finn", 60)
# player_2 = Player.new("lucy", 90)
# player_3 = Player.new("jase")
# player_4 = Player.new("alex", 125)

game = Game.new("Winner Takes All")
# game.add_player(player_1)
# game.add_player(player_2)
# game.add_player(player_3)
# game.add_player(player_4)

players_file = File.join(__dir__, "players.csv")
game.load_players(ARGV.shift || players_file)

loop do
  print "\nHow many game rounds? ('quit' to exit) "
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    game.play(answer.to_i)
  when "quit", "exit"
    game.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

# game.play(4)
game.print_stats
game.save_high_scores

# Bonus game
# p1 = Player.new("david", 60)
# p2 = Player.new("goliath", 90)

# bonus_game = Game.new("War")
# bonus_game.add_player(p1)
# bonus_game.add_player(p2)
# bonus_game.play