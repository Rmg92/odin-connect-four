# frozen_string_literal: true

require 'player'

# contains all the logic needed for the game to be played
class Game
  def play
    create_players
  end

  def create_players
    puts 'Insert player 1 name?'
    @player_one = Player.new(gets, "\u26AA")
    puts 'Insert player 2 name?'
    @player_two = Player.new(gets, "\u26AB")
  end
end
