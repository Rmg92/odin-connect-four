# frozen_string_literal: true

require_relative 'display'
require_relative 'player'
require_relative 'board'

# contains all the logic needed for the game to be played
class Game
  include Display

  PIECES = ["\e[32m\u25CF\e[0m", "\e[31m\u25CF\e[0m"].freeze

  def play
    display_rules(PIECES)
    setup_game
    play_round until winner? || @round == 43
  end

  def setup_game
    @winner = false
    @round = 1
    create_players
    create_board
  end

  def play_round
    display_current_round(current_player.name)
    @board.drop_piece(player_drop_input, current_player.piece)
    display_board(@board.board)
    @round += 1
  end

  def create_players
    @player_one = new_player(1)
    @player_two = new_player(2)
  end

  def new_player(player_number)
    display_player_name(player_number)
    Player.new(gets, PIECES[player_number - 1])
  end

  def create_board
    @board = Board.new
  end

  def player_drop_input
    input = gets.to_i
    return input unless !input.between?(1, 7) || @board.full_column?(input)

    puts 'Invalid input'
    player_drop_input
  end

  def current_player
    return @player_one if @round.odd?

    @player_two
  end

  def winner?
    @board.four_connected?
  end
end
