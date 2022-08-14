# frozen_string_literal: true

require_relative 'display'
require_relative 'player'
require_relative 'board'

# contains all the logic needed for the game to be played
class Game
  include Display

  def play
    display_rules
    setup_game
  end

  def setup_game
    create_players
    create_board
  end

  def create_players
    puts 'Insert player 1 name?'
    @player_one = Player.new(gets, "\u26AA")
    puts 'Insert player 2 name?'
    @player_two = Player.new(gets, "\u26AB")
  end

  def create_board
    @board = Board.new
  end
end
