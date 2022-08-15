# frozen_string_literal: true

require_relative 'display'
require_relative 'player'
require_relative 'board'

# contains all the logic needed for the game to be played
class Game
  include Display

  PIECES = ["\u26AA", "\u26AB"].freeze

  def play
    display_rules
    setup_game
  end

  def setup_game
    create_players
    create_board
  end

  def create_players
    @player_one = new_player(1)
    @player_two = new_player(2)
  end

  def new_player(player_number)
    puts "Hello Player #{player_number}, what's your name?"
    Player.new(gets, PIECES[player_number - 1])
  end

  def create_board
    @board = Board.new
  end
end
