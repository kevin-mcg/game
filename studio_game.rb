require_relative "lib/studio_game/game"
require_relative "lib/studio_game/player"


player_1 = Player.new("finn", 60)
player_2 = Player.new("lucy", 90)
player_3 = Player.new("jase")
player_4 = Player.new("alex", 125)

game = Game.new("Winner Takes All")
game.add_player(player_1)
game.add_player(player_2)
game.add_player(player_3)
game.add_player(player_4)
game.play(3)
game.print_stats

# Bonus game
# p1 = Player.new("david", 60)
# p2 = Player.new("goliath", 90)

# bonus_game = Game.new("War")
# bonus_game.add_player(p1)
# bonus_game.add_player(p2)
# bonus_game.play