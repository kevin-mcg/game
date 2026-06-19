require "minitest/autorun"

require_relative "../../lib/studio_game/player"

class PlayerTest < Minitest::Test

  def test_has_a_capitalized_name
    player = Player.new("finn", 60)

    assert_equal "Finn", player.name
  end

  def test_has_an_initial_value
    player = Player.new("finn", 60)

    assert_equal 60, player.health
  end

  def test_has_a_score
    player = Player.new("finn", 60)

    assert_equal 64, player.score
  end

  def test_returns_a_string
    player = Player.new("finn", 60)

    assert_equal "I'm Finn with a health of 60 and a score of 64", player.to_s
  end

  def test_can_be_boosted
    player = Player.new("finn", 60)

    assert_equal 75, player.boost
  end

  def test_can_be_drained
    player = Player.new("finn", 60)

    assert_equal 50, player.drain
  end

end